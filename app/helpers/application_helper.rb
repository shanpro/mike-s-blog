# -*- encoding: utf-8 -*-
module ApplicationHelper
	def format_topic_time(pub_time)
		pub_time.strftime("%Y-%m-%d %H:%M:%S")
	end

	def ssep_paginate(per_page)
		html = "<select id='will_paginate' name='per_page'>"
		case per_page
		when "20"
			html << "<option value='10'>10</option>"
			html << "<option value='20' selected='true'>20</option>"
			html << "<option value='30'>30</option>"
		when "30"
			html << "<option value='10'>10</option>"
			html << "<option value='20'>20</option>"
			html << "<option value='30' selected='true'>30</option>"
		else
			html << "<option value='10' selected='true'>10</option>"
			html << "<option value='20'>20</option>"
			html << "<option value='30'>30</option>"
		end
		html << "</select>"
		raw html
	end

	def ssep_nav(section)
		unless section.blank?
			raw "&nbsp;&gt;&nbsp;" + Section.find(section).title
		else
			raw "&nbsp;&gt;&nbsp;" + Section.find_by_eng_name(controller_name).children.first.title			
		end
	end
end
