# -*- encoding: utf-8 -*-
class LiveStoriesController < ApplicationController
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



	######TODO 苦闷商量 ########仅自己和管理员可见
	def index
		if params[:section].eql? "17"
			@live_stories = LiveStory.where( \
				section_id: (params[:section] || @section.children.first.id), status: "1", user_id: current_user.id) \
			.page(params[:page]).per(params[:per_page])
		else
			@live_stories = LiveStory.where(section_id: (params[:section] || @section.children.first.id), status: "1") \
			.page(params[:page]).per(params[:per_page])
		end
	end

	def show
		LiveStory.increment_counter(:view_count, params[:id]) unless params[:viewed].blank?
		@comment = Comment.new
		@live_story = LiveStory.find(params[:id])
	end

	def new
		@live_story = LiveStory.new
	end

	def create
		if params[:live_story][:status] == "2"
			redirect_to action: "index"
		else
			@live_story = LiveStory.new(params[:live_story])
			if @live_story.save
				redirect_to "/live_stories?section=#{@live_story.section_id}"
			else
				flash[:error] = "发布失败， #{@live_story.errors.messages.values.join(',')}"
				redirect_to :back 
			end
		end
	end

	def edit
		@live_story = LiveStory.find(params[:id])		
	end

	def update
		if params[:live_story][:status] == "2"
			redirect_to action: "index"
		else
			@live_story = LiveStory.find(params[:id])
			if @live_story.update_attributes(params[:live_story])
				redirect_to "/live_stories?section=#{@live_story.section_id}"
			else
				flash[:error] = "更新失败， #{@live_story.errors.messages.values.join(',')}"
				redirect_to :back
			end		
		end
	end

	def destroy
		
	end

	def topic_logs
		@live_story = LiveStory.find(params[:live_story_id])
		@topic_logs = @live_story.topic_logs.page(params[:page]).per(params[:per_page])
	end

end
