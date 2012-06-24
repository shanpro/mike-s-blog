class ApplicationController < ActionController::Base
  protect_from_forgery

  def load_tree
  	@section = Section.find_by_eng_name(controller_name)
  end
end
