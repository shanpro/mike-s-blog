class AnnouncementsController < ApplicationController
  def index
    @announcements = Announcement.all
  end

  def new
    @announcement = Announcement.new
  end

  def create
    case params["oper"]
    when "cancel"
      redirect_to :action => "index" and return
    when "snap"
      @an = Announcement.create(params["announcement"])
      redirect_to :action => "show", :id => @an
    else
      @an = Announcement.create(params["announcement"])
      redirect_to :action => "show", :id => @an
    end
  end

  def edit
    @announcement = Announcement.find(params[:id])
  end

  def update
    if params["oper"] == "cancel"
      redirect_to :action => "index" and return
    else
      @an = Announcement.find(params[:id])
      @an.update_attributes(params[:announcement])
      redirect_to :action => "show", :id => @an
    end
  end

  def show
    @announcement = Announcement.find(params[:id])
  end

  def destroy
    @an = Announcement.find(params[:id])
    @an.destroy
    redirect_to :action => "index"
  end
end
