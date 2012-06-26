class CalendarsController < ApplicationController
  def index
  end

  def show
  end

  def create
    cal = Calendar.create(params[:calendar])
    topic = Topic.create(params[:topic].merge(:calendar_id => cal.id))
  end
end
