class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  def load_tree
  	@section = Section.find_by_eng_name(controller_name)
  end

  def set_locale
  	if params[:locale] && ["zh-CN", "ko"].include?(params[:locale])
  		session[:locale] = params[:locale]
  	end

  	I18n.locale = session[:locale] || I18n.default_locale
  end

  def create_topic_log(args)
    TopicLog.create_log(args[:user_id], args[:topic_id], args[:oper_type], args[:oper_controller])
  end
end
