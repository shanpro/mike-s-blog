class TopicsController < ApplicationController


  def create
    topic = Topic.create(params[:topic])
  end
end