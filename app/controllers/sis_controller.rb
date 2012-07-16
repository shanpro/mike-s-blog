# -*- encoding: utf-8 -*-
class SisController < ApplicationController
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
		@sis = Si.where(section_id: (params[:section] || @section.children.first.id), status: "1") \
		.page(params[:page]).per(params[:per_page])
	end

	def show
		Si.increment_counter(:view_count, params[:id]) unless params[:viewed].blank?
		@comment = Comment.new
		@si = Si.find(params[:id])
	end

	def new
		@si = Si.new
	end

	def create
		if params[:si][:status] == "2"
			redirect_to action: "index"
		else
			@si = Si.new(params[:si])
			if @si.save
				redirect_to "/sis?section=#{@si.section_id}"
			else
				flash[:error] = "发布失败， #{@si.errors.messages.values.join(',')}"
				redirect_to :back 
			end
		end
	end

	def edit
		@si = Si.find(params[:id])		
	end

	def update
		if params[:si][:status] == "2"
			redirect_to action: "index"
		else
			@si = Si.find(params[:id])
			if @si.update_attributes(params[:si])
				redirect_to "/sis?section=#{@si.section_id}"
			else
				flash[:error] = "更新失败， #{@si.errors.messages.values.join(',')}"
				redirect_to :back
			end
		end		
	end

	def destroy
		
	end

	def topic_logs
		@si = Si.find(params[:si_id])
		@topic_logs = @si.topic_logs.page(params[:page]).per(params[:per_page])
	end

end
