# -*- encoding: utf-8 -*-
class CommentsController < ApplicationController
	before_filter only: [:create] do |controller|
		controller.create_topic_log(
			{
				:user_id => current_user.id, 
				:topic_id => params["comment"]["topic_id"],
				:oper_type => params["action"],
				:oper_controller => params["controller"]
			}
		)
	end


	def index
		
	end

	def show
		
	end

	def new
		@comment = Comment.new
	end

	def edit
		
	end

	def create
		@comment = Comment.new(params[:comment])
		if @comment.save
			flash[:notice] = "回复成功！"
			render :create
		end
	end

	def update
		
	end
end
