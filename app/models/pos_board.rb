# -*- encoding:utf-8 -*-
class PosBoard < ActiveRecord::Base
	has_many :pos_logs
	belongs_to :user
	has_many :pos_comments, class_name: "PosComment", finder_sql: Proc.new{
		%Q{select * from pos_comments where section_id = #{section_id} and pos_id = #{id} }
	}
	default_scope order("updated_at DESC")


	SECTION = Hash[1, "IT留言板", 2, "一般留言板", 3, "柜台建议留言板"]

	def brand
		User::BRAND[brand_id.to_s]
	end

	def section
		PosBoard::SECTION[section_id]
	end

end

