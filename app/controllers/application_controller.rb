class ApplicationController < ActionController::Base
  protect_from_forgery

  def load_tree
  	@section = Section.find_by_eng_name(controller_name)
  end

  def set_locale
  	if params[:locale] && ["zh-CN", "ko"].include?(params[:locale])
  		session[:locale] = params[:locale]
  	end

  	I18n.locale = session[:locale] || I18n.default_locale
  end
end
