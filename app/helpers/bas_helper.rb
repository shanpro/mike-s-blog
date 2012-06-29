# -*- encoding: utf-8 -*-
module BasHelper
	def ba_section_options
		html = ""
		html << "<select id='ba_section_id' name='ba[section_id]'>"
		@section.children.each do |child|
			html << "<option value='#{child.id}'>#{child.title}</option>" unless child.eng_name.eql? "bp_case"
		end
		html << "</select>"
		raw html
	end
end
