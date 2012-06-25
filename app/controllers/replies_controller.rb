# -*- encoding: utf-8 -*-
class RepliesController < ApplicationController
	def index
		
	end

	def new
		
	end

	def create
		@reply = Reply.new(params[:reply])
		if @reply.save
			flash[:notice] = "回复成功！"
			render :create
		end
	end
end
