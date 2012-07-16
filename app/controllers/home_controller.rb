class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    @topics1 = BestPractice.where(section_id: 12).order("created_at DESC").limit(4)
    @topics2 = BestPractice.where(section_id: 13).order("created_at DESC").limit(4)
  end

  def change_language
  	render text: "ok"
  end

  def settings
    render "/#{params[:action]}/index"
  end

  def settings_area
    render "/#{params[:action]}/index"
  end
  
  def settings_limits
    render "/#{params[:action]}/index"
  end
end
