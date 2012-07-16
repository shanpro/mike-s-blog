# -*- encoding: utf-8 -*-
class ProductsController < ApplicationController
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
		@products = Product.where(section_id: (params[:section] || @section.children.first.id), status: "1") \
		.page(params[:page]).per(params[:per_page])
	end

	def show
		Product.increment_counter(:view_count, params[:id]) unless params[:viewed].blank?
		@comment = Comment.new
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
	end

	def create
		if params[:product][:status] == "2"
			redirect_to action: "index"
		else

			@product = Product.new(params[:product])
			if @product.save
				redirect_to "/products?section=#{@product.section_id}"
			else
				flash[:error] = "发布失败， #{@product.errors.messages.values.join(',')}"
				redirect_to :back 
			end
		end
	end

	def edit
		@product = Product.find(params[:id])		
	end

	def update
		if params[:product][:status] == "2"
			redirect_to action: "index"
		else

			@product = Product.find(params[:id])
			if @product.update_attributes(params[:product])
				redirect_to "/products?section=#{@product.section_id}"
			else
				flash[:error] = "更新失败， #{@product.errors.messages.values.join(',')}"
				redirect_to :back
			end		
		end
	end

	def destroy
		
	end

	def topic_logs
		@product = Product.find(params[:product_id])
		@topic_logs = @product.topic_logs.page(params[:page]).per(params[:per_page])
	end

end

