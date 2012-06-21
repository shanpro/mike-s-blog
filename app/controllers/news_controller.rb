# -*- encoding: utf-8 -*-
class NewsController < ApplicationController

	def index
		unless params[:brand].blank?
			@news = News.brand_news(params[:brand])
		else
			@news = News.all_datas("news").page(params[:page]).per(params[:per_page])
		end
	end

	def show
		News.increment_counter(:view_count, params[:id])
		@news = News.find(params[:id])
	end

	def new
		@news = News.new
	end

	def create
		@news = News.new(params[:news])
		@news.brand_id = params[:news][:brand_id] || current_user.brand_id
		@news.section_id = Section.find_by_eng_name(params[:news][:section_name]).id
		if @news.save
			redirect_to "/news?section=news"
		else
			# render :new , error: "发布失败, #{@news.errors.messages}", brand: params[:brand]
			flash[:error] = "发布失败， #{@news.errors.messages.values.join(',')}"
			redirect_to :back, 
		end
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end
end
