# -*- encoding: utf-8 -*-
module ApplicationHelper
	def format_topic_time(pub_time)
		pub_time.strftime("%Y-%m-%d %H:%M:%S")
	end
end
