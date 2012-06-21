# -*- encoding: utf-8 -*-
module NewsHelper
	def news_nav(brand)
		html = ""
		html << "&nbsp;&gt;&nbsp;<a href='/news?brand=#{brand}'>#{User::BRAND[brand]}</a>" unless brand.blank?
	end
end
