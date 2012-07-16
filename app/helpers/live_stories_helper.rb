module LiveStoriesHelper
	def story_section_options
		html = ""
		html << "<select id='live_story_section_id' name='live_story[section_id]'>"
		@section.children.each do |child|
			html << "<option value='#{child.id}'>#{child.title}</option>" unless child.eng_name.eql? "praise_format"
		end
		html << "</select>"
		raw html
	end
end
