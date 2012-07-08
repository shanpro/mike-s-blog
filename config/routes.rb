Ssep::Application.routes.draw do
  devise_for :users

  root :to => "home#index"

  get "home/change_language", to: "home#change_language"
  get "/settings",        to: "home#settings"
  get "/settings_user",   to: "home#settings_user"
  get "/settings_limits", to: "home#settings_limits"
  get "/settings_area",   to: "home#settings_area"
  resources "news" do
    get "topic_logs"
  end
  resources "comments"
  resources "replies"
  resources "bas" do
    get "topic_logs"
  end
  resources "live_stories" do
    get "topic_logs"
  end

  match "calendars/form_box" => "calendars#form_box", :via => :get
  match "calendars/current_events" => "calendars#current_events", :via => :get, :format => :json

  resources "calendars"

  resources "best_practices" do
    get "topic_logs"
  end
  resources "sales" do
    get "topic_logs"
  end
  resources "sis" do
    get "topic_logs"
  end
  resources "announcements"

  resources "bp_cases" do
    get "topic_logs"
  end


  resources "praises" do
    get "recommend", to: "praises#recommend"
  end
  
  resources "products" do
    get "topic_logs"
  end

  resources "pos_boards"
  resources "pos_firms"
end
