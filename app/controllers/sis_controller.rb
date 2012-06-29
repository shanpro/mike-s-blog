# -*- encoding: utf-8 -*-
class SisController < ApplicationController
	before_filter :load_tree
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
		@si = Si.new(params[:si])
		if @si.save
			redirect_to "/sis?section=#{@si.section_id}"
		else
			flash[:error] = "发布失败， #{@si.errors.messages.values.join(',')}"
			redirect_to :back 
		end
	end

	def edit
		@si = Si.find(params[:id])		
	end

	def update
		@si = Si.find(params[:id])
		if @si.update_attributes(params[:si])
			redirect_to "/sis?section=#{@si.section_id}"
		else
			flash[:error] = "更新失败， #{@si.errors.messages.values.join(',')}"
			redirect_to :back
		end		
	end

	def destroy
		
	end
end
