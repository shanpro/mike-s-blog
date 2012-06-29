# -*- encoding: utf-8 -*-
class BasController < ApplicationController
	before_filter :load_tree
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
		@ba = Ba.new(params[:ba])
		if @ba.save
			redirect_to "/bas?section=#{@ba.section_id}"
		else
			flash[:error] = "发布失败， #{@ba.errors.messages.values.join(',')}"
			redirect_to :back 
		end
	end

	def edit
		@ba = Ba.find(params[:id])		
	end

	def update
		@ba = Ba.find(params[:id])
		if @ba.update_attributes(params[:ba])
			redirect_to "/bas?section=#{@ba.section_id}"
		else
			flash[:error] = "更新失败， #{@ba.errors.messages.values.join(',')}"
			redirect_to :back
		end		
	end

	def destroy
		
	end
end
