# -*- encoding: utf-8 -*-
class PosBoardsController < ApplicationController
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
		@pos_boards = PosBoard.where(status: "1", section_id: params[:section]).page(params[:page]).per(params[:per_page])
	end

	def show
		PosBoard.increment_counter(:view_count, params[:id]) unless params[:viewed].blank?
		@comment = Comment.new
		@pos_board = PosBoard.find(params[:id])
	end

	def new
		@pos_board = PosBoard.new
	end

	def create
		if params[:pos_board][:status] == "2"
			redirect_to action: "index"
		else
			@pos_board = PosBoard.new(params[:pos_board])
			if @pos_board.save
				redirect_to "/pos_boards?section=#{@pos_board.section_id}"
			else
				flash[:error] = "发布失败， #{@pos_board.errors.messages.values.join(',')}"
				redirect_to :back 
			end
		end
	end

	def edit
		@pos_board = PosBoard.find(params[:id])		
	end

	def update
		if params[:pos_board][:status] == "2"
			redirect_to action: "index"
		else
			@pos_board = PosBoard.find(params[:id])
			if @pos_board.update_attributes(params[:pos_board])
				redirect_to "/pos_boards?section=#{@pos_board.section_id}"
			else
				flash[:error] = "更新失败， #{@pos_board.errors.messages.values.join(',')}"
				redirect_to :back
			end		
		end
	end

	def destroy
		
	end

	def pos_logs
		@pos_board = PosBoard.find(params[:pos_board_id])
		@topic_logs = @pos_board.topic_logs.page(params[:page]).per(params[:per_page])
	end

end
