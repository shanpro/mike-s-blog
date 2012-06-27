Ssep::Application.routes.draw do
  devise_for :users

  root :to => "home#index"

  
  resources "news"
  resources "comments"
  resources "replies"
  resources "bas"
  resources "live_stories"
  resources "best_practices"
  resources "sales"
  resources "sis"
  resources "announcements"
  match "calendars/form_box" => "calendars#form_box", :via => :get
  match "calendars/current_events" => "calendars#current_events", :via => :get, :format => :json
  resources "calendars"

  devise_for :admins, :controllers => { :sessions => 'magic_admin/sessions' }

  mount MagicAdmin::Engine => '/admin', :as => 'magic_admin'
  mount MagicContent::Engine => "/admin/content", :as => "magic_content"  
end
