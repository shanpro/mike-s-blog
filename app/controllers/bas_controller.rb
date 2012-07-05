# -*- encoding: utf-8 -*-
class BasController < ApplicationController
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
		@bas = Ba.where(section_id: (params[:section] || @section.children.first.id), status: "1") \
		.page(params[:page]).per(params[:per_page])
	end

	def show
		Ba.increment_counter(:view_count, params[:id]) unless params[:viewed].blank?
		@comment = Comment.new
		@ba = Ba.find(params[:id])
	end

	def new
		@ba = Ba.new
	end

	def create
		if params[:ba][:status] == "2"
			redirect_to action: "index"
		else
			@ba = Ba.new(params[:ba])
			if @ba.save
				redirect_to "/bas?section=#{@ba.section_id}"
			else
				flash[:error] = "发布失败， #{@ba.errors.messages.values.join(',')}"
				redirect_to :back 
			end
		end
	end

	def edit
		@ba = Ba.find(params[:id])		
	end

	def update
		if params[:ba][:status] == "2"
			redirect_to action: "index"
		else
			@ba = Ba.find(params[:id])
			if @ba.update_attributes(params[:ba])
				redirect_to "/bas?section=#{@ba.section_id}"
			else
				flash[:error] = "更新失败， #{@ba.errors.messages.values.join(',')}"
				redirect_to :back
			end	
		end	
	end

	def destroy
		
	end

	def topic_logs
		@ba = Ba.find(params[:ba_id])
		@topic_logs = @ba.topic_logs.page(params[:page]).per(params[:per_page])
	end

end
