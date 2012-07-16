# -*- encoding: utf-8 -*-
class RepliesController < ApplicationController
	before_filter only: [:create] do |controller|
		controller.create_topic_log(
			{
				:user_id => current_user.id, 
				:topic_id => params["replies"]["topic_id"],
				:oper_type => params["action"],
				:oper_controller => params["controller"]
			}
		)
	end


	def index
		
	end

	def new
		
	end

	def create
		@reply = Reply.new(params[:reply])
		if @reply.save
			flash[:notice] = "回复成功！"
			render :create
		end
	end
end
