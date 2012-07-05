# -*- encoding: utf-8 -*-
class PosFirmsController < ApplicationController
	# before_filter only: [:show, :update, :destroy] do |controller|
	# 	controller.create_pos_log(
	# 		{
	# 			:user_id => current_user.id, 
	# 			:topic_id => params[:id],
	# 			:oper_type => params["action"],
	# 			:oper_controller => params["controller"]
	# 		}
	# 	)
	# end

	def index
		@pos_firms = PosFirm.where(status: "1", area_id: params[:area]).page(params[:page]).per(params[:per_page])
	end

	def show
		PosFirm.increment_counter(:view_count, params[:id]) unless params[:viewed].blank?
		@comment = Comment.new
		@pos_firm = PosFirm.find(params[:id])
	end

	def new
		@pos_firm = PosFirm.new
	end

	def create
		if params[:pos_firm][:status] == "2"
			redirect_to action: "index"
		else
			@pos_firm = PosFirm.new(params[:pos_firm])
			if @pos_firm.save
				redirect_to "/pos_firms?area=#{@pos_firm.area_id}"
			else
				flash[:error] = "发布失败， #{@pos_firm.errors.messages.values.join(',')}"
				redirect_to :back 
			end
		end
	end

	def edit
		@pos_firm = PosFirm.find(params[:id])		
	end

	def update
		if params[:pos_firm][:status] == "2"
			redirect_to action: "index"
		else
			@pos_firm = PosFirm.find(params[:id])
			if @pos_firm.update_attributes(params[:pos_firm])
				redirect_to "/pos_firms?area=#{@pos_firm.area_id}"
			else
				flash[:error] = "更新失败， #{@pos_firm.errors.messages.values.join(',')}"
				redirect_to :back
			end		
		end
	end

	def destroy
		
	end

	def pos_logs
		@pos_firm = PosFirm.find(params[:pos_firm_id])
		@topic_logs = @pos_firm.topic_logs.page(params[:page]).per(params[:per_page])
	end

end
