# -*- encoding: utf-8 -*-
class Praise < ActiveRecord::Base
	has_many :comments, class_name: "Comment", finder_sql: Proc.new{
		%Q{select distinct * from comments where section_id = 16 and topic_id = #{id} }
	}
	belongs_to :user
	belongs_to :section

	paginates_per 10

	def brand
		User::BRAND[brand_id.to_s]
	end


end
