# -*- encoding : utf-8 -*-
#$:.unshift(File.expand_path('./lib', ENV['rvm_path']||="~/.rvm")) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
set :rvm_ruby_string, '1.9.2'        # Or whatever env you want it to run in.

require 'bundler/capistrano'

 set :rvm_path, "/usr/local/rvm"
 set :rvm_bin_path, "/usr/local/rvm/bin"
set :application, "ssep"

set :rvm_trust_rvmrcs_flag, 1
set :normalize_asset_timestamps, false

set :use_sudo, false
set :scm, :git
set :deploy_via, :remote_cache

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :keep_releases, 3

set :git_shallow_clone, 1
set :git_enable_submodules, 1

role :web, "ssep.doorder.com" # Your HTTP server, Apache/etc
role :app, "ssep.doorder.com" # This may be the same as your `Web` server
role :db, "ssep.doorder.com", :primary => true # This is where Rails migrations will run

set :user, "root"
set :repository, "git@github.com:nioteam/ssep.git"
set :branch, "master"
set :deploy_to, "/var/rails/ssep"

# tasks
namespace :deploy do

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Symlink shared resources on each release"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/system #{release_path}/public/system"
  end

end

#after 'deploy:update_code', 'deploy:symlink_shared'
before 'bundle:install', 'deploy:symlink_shared'
#after "deploy:finalize_code", "deploy:symlink_shared"

require 'capistrano-unicorn'
