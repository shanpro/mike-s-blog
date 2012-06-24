Ssep::Application.routes.draw do
  devise_for :users

  root :to => "home#index"

  
  resources "news"
  resources "comments"
  resources "replies"
  resources "bas"
  resources "live_stories"
  resources "calendars"
  resources "best_practices"
  resources "sales"
  resources "sis"
  resources "announcements"

  devise_for :admins, :controllers => { :sessions => 'magic_admin/sessions' }

  mount MagicAdmin::Engine => '/admin', :as => 'magic_admin'
  mount MagicContent::Engine => "/admin/content", :as => "magic_content"  
end
