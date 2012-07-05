# -*- encoding: utf-8 -*-
class BestPracticesController < ApplicationController
	before_filter :load_tree
	
	before_filter only: [:show, :update, :destroy] do |controller|
		controller.create_topic_log(
			{
				:user_id => current_user.id, 
				:topic_id => params[:id],
				:oper_type => params["action"],
				:oper_controller => params["controller"]
			}
		)
	end


	def index
		@best_practices = BestPractice.where(section_id: (params[:section] || @section.children.first.id), status: "1") \
		.page(params[:page]).per(params[:per_page])
	end

	def show
		BestPractice.increment_counter(:view_count, params[:id]) unless params[:viewed].blank?
		@comment = Comment.new
		@best_practice = BestPractice.find(params[:id])
	end

	def new
		@best_practice = BestPractice.new
	end

	def create
		if params[:best_practice][:status] == "2"
			redirect_to action: "index"
		else

			@best_practice = BestPractice.new(params[:best_practice])
			if @best_practice.save
				redirect_to "/best_practices?section=#{@best_practice.section_id}"
			else
				flash[:error] = "发布失败， #{@best_practice.errors.messages.values.join(',')}"
				redirect_to :back 
			end
		end
	end

	def edit
		@best_practice = BestPractice.find(params[:id])		
	end

	def update
		if params[:best_practice][:status] == "2"
			redirect_to action: "index"
		else

			@best_practice = BestPractice.find(params[:id])
			if @best_practice.update_attributes(params[:best_practice])
				redirect_to "/best_practices?section=#{@best_practice.section_id}"
			else
				flash[:error] = "更新失败， #{@best_practice.errors.messages.values.join(',')}"
				redirect_to :back
			end		
		end
	end

	def destroy
		
	end

	def topic_logs
		@best_practice = BestPractice.find(params[:best_practice_id])
		@topic_logs = @best_practice.topic_logs.page(params[:page]).per(params[:per_page])
	end

end
