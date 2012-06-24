Ssep::Application.routes.draw do

  devise_for :users
  # devise_scope :user do
  #   get "login", :to => "devise/sessions#new"
  #   get "register", :to => "devise/registrations#new"
  #   get "logout", :to => "devise/sessions#destroy"
  #   get "profile", :to => "devise/registrations#edit"
  # end

  root :to => "home#index"

  resources :announcements
  resources "news"
  resources "bas"
  resources "live_stories"
  resources "calendars"
  resources "best_practices"
  resources "sales"
  resources "sis"

  devise_for :admins, :controllers => { :sessions => 'magic_admin/sessions' }

  mount MagicAdmin::Engine => '/admin', :as => 'magic_admin'
  mount MagicContent::Engine => "/admin/content", :as => "magic_content"  
end
