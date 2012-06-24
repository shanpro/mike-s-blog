# -*- encoding: utf-8 -*-
class CommentsController < ApplicationController
	def index
		
	end

	def show
		
	end

	def new
		@comment = Comment.new
	end

	def edit
		
	end

	def create
		@comment = Comment.new(params[:comment])
		if @comment.save
			flash[:notice] = "回复成功！"
			render :create
		end
	end

	def update
		
	end
end
