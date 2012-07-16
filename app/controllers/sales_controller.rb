# -*- encoding: utf-8 -*-
class SalesController < ApplicationController
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
		@sales = Sale.where(section_id: (params[:section] || @section.children.first.id), status: "1") \
		.page(params[:page]).per(params[:per_page])
	end

	def show
		Sale.increment_counter(:view_count, params[:id]) unless params[:viewed].blank?
		@comment = Comment.new
		@sale = Sale.find(params[:id])
	end

	def new
		@sales = Sale.new
	end

	def create
		if params[:sale][:status] == "2"
			redirect_to action: "index"
		else

			@sales = Sale.new(params[:sale])
			@sales.section_name = Section.find(@sales.section_id)
			if @sales.save
				redirect_to "/sales?section=#{@sales.section_id}"
			else
				flash[:error] = "发布失败， #{@sales.errors.messages.values.join(',')}"
				redirect_to :back 
			end
		end
	end

	def edit
		@sales = Sale.find(params[:id])		
	end

	def update
		if params[:sale][:status] == "2"
			redirect_to action: "index"
		else

			@sales = Sale.find(params[:id])

			if @sales.update_attributes(params[:sale])
				redirect_to "/sales?section=#{@sales.section_id}"
			else
				flash[:error] = "更新失败， #{@sales.errors.messages.values.join(',')}"
				redirect_to :back
			end		
		end
	end

	def destroy
		
	end

	def topic_logs
		@sale = Sale.find(params[:sale_id])
		@topic_logs = @sale.topic_logs.page(params[:page]).per(params[:per_page])
	end

end
