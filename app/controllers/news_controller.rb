# -*- encoding: utf-8 -*-
class NewsController < ApplicationController

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
		unless params[:brand].blank?
			@news = News.brand_news(params[:brand]).page(params[:page]).per(params[:per_page])
		else
			@news = News.all_datas("news").page(params[:page]).per(params[:per_page])
		end
	end

	def show
		News.increment_counter(:view_count, params[:id]) unless params[:viewed].blank?
		@comment = Comment.new
		@news = News.find(params[:id])
	end

	def new
		@news = News.new
	end

	def create
		if params[:news][:status] == "2"
			redirect_to :back
		else
			@news = News.new(params[:news])
			@news.brand_id = params[:news][:brand_id] || current_user.brand_id
			@news.section_id = Section.find_by_eng_name(params[:news][:section_name]).id
			if @news.save
				redirect_to "/news?section=news"
			else
				flash[:error] = "发布失败， #{@news.errors.messages.values.join(',')}"
				redirect_to "index"
			end
		end
	end

	def edit
		@news = News.find(params[:id])		
	end

	def update
		if params[:news][:status] == "2"
			redirect_to action: "index"
		else
			@news = News.find(params[:id])
			if @news.update_attributes(params[:news])
				redirect_to "/news?section=news"
			else
				flash[:error] = "更新失败， #{@news.errors.messages.values.join(',')}"
				redirect_to :back
			end	
		end	
	end

	def destroy

	end

	def topic_logs
		@news = News.find(params[:news_id])
		@topic_logs = @news.topic_logs.page(params[:page]).per(params[:per_page])
	end
end
