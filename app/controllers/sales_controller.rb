# -*- encoding: utf-8 -*-
class SalesController < ApplicationController
	before_filter :load_tree

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
		@sales = Sale.new(params[:sale])
		@sales.section_name = Section.find(@sales.section_id)
		if @sales.save
			redirect_to "/sales?section=#{@sales.section_id}"
		else
			flash[:error] = "发布失败， #{@sales.errors.messages.values.join(',')}"
			redirect_to :back 
		end
	end

	def edit
		@sales = Sale.find(params[:id])		
	end

	def update
		@sales = Sale.find(params[:id])

		if @sales.update_attributes(params[:sale])
			redirect_to "/sales?section=#{@sales.section_id}"
		else
			flash[:error] = "更新失败， #{@sales.errors.messages.values.join(',')}"
			redirect_to :back
		end		
	end

	def destroy
		
	end
end
