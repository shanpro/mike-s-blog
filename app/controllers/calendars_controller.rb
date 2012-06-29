class CalendarsController < ApplicationController
  def index
  end

  def show
    @cal = Calendar.find(params[:id])
  end

  def create
    cal = Calendar.create(params[:calendar])
    cal.update_attributes(:url => calendar_path(cal), :title => params[:topic][:title])
    topic = Topic.create(params[:topic].merge(:calendar_id => cal.id))
    render :text => calendar_path(cal)
  end

  def form_box
    render "shared/_form", :layout => false
  end
  
  def current_events
    @cals = Calendar.where(["start >= ? and end <= ?", params[:start].to_time, params[:end].to_time]).select("id, title, start, end, url, allday as allDay")
    render :json => @cals.to_json
  end
end
