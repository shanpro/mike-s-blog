# -*- encoding: utf-8 -*-
class PraisesController < ApplicationController
	before_filter :praise_tree
	def index
		@praises = Praise.where(status: "1").page(params[:page]).per(params[:per_page])
	end

	def show
		Praise.increment_counter(:view_count, params[:id]) unless params[:viewed].blank?
		@comment = Comment.new
		@praise = Praise.find(params[:id])
	end

	def new
		@praise = Praise.new
	end

	def create
		@praise = Praise.new(params[:praise])
		if @praise.save
			redirect_to "/praises"
		else
			flash[:error] = "发布失败， #{@praise.errors.messages.values.join(',')}"
			redirect_to :back 
		end
	end

	def edit
		@praise = Praise.find(params[:id])		
	end

	def update
		@praise = Praise.find(params[:id])
		if @praise.update_attributes(params[:praise])
			redirect_to "/praises"
		else
			flash[:error] = "更新失败， #{@praise.errors.messages.values.join(',')}"
			redirect_to :back
		end		
	end

	def destroy
		
	end

	def recommend
		Praise.increment_counter(:recommend_count, params[:praise_id])
		render js: "alert('推荐成功');"
	end

	private

	def praise_tree
		@section = Section.find_by_eng_name("live_stories")
	end
end