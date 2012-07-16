# -*- encoding: utf-8 -*-
class TopicLog < ActiveRecord::Base
	belongs_to :news
	belongs_to :bas
	belongs_to :best_practices
	belongs_to :bp_cases
	belongs_to :live_stories
	belongs_to :sales
	belongs_to :praises
	belongs_to :sis
	belongs_to :user
	OPER_TYPE = Hash["1", "浏览", "2", "回复", "3", "修改", "4", "删除"]
	default_scope order("updated_at DESC")

	def self.create_log(user_id, topic_id, oper_type, oper_controller)
		action_type = ""
		if oper_controller.eql?("comments") or oper_controller.eql?("replies")
			action_type = "2"
		else
			case oper_type
			when "show"
				action_type = "1"
			when "update"
				action_type = "3"
			when "destroy"
				action_type = "4"
			end	
		end
		self.create(user_id: user_id, topic_id: topic_id, operated_type: action_type, operated_at: Time.now)
	end
end
