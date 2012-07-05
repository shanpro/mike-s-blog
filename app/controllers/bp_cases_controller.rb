# -*- encoding: utf-8 -*-
class BpCasesController < ApplicationController
	before_filter :bp_case_tree
	
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
		@bp_cases = BpCase.where(status: "1").page(params[:page]).per(params[:per_page])
	end

	def show
		BpCase.increment_counter(:view_count, params[:id]) unless params[:viewed].blank?
		@comment = Comment.new
		@bp_case = BpCase.find(params[:id])
	end

	def new
		@bp_case = BpCase.new
	end

	def create
		if params[:bp_case][:status] == "2"
			redirect_to action: "index"
		else
			@bp_case = BpCase.new(params[:bp_case])
			if @bp_case.save
				redirect_to "/bp_cases?section=#{@bp_case.section_id}"
			else
				flash[:error] = "发布失败， #{@bp_case.errors.messages.values.join(',')}"
				redirect_to :back 
			end
		end
	end

	def edit
		@bp_case = BpCase.find(params[:id])		
	end

	def update
		if params[:bp_case][:status] == "2"
			redirect_to action: "index"
		else
			@bp_case = BpCase.find(params[:id])
			if @bp_case.update_attributes(params[:bp_case])
				redirect_to "/bp_cases?section=#{@bp_case.section_id}"
			else
				flash[:error] = "更新失败， #{@bp_case.errors.messages.values.join(',')}"
				redirect_to :back
			end		
		end
	end

	def destroy
		
	end

	def topic_logs
		@bp_case = BpCase.find(params[:bp_case_id])
		@topic_logs = @bp_case.topic_logs.page(params[:page]).per(params[:per_page])
	end

	private

	def bp_case_tree
		@section = Section.find_by_eng_name("bas")
	end
end
