# -*- encoding: utf-8 -*-
class PosFirm < ActiveRecord::Base
	has_many :pos_logs
	belongs_to :user
	has_many :pos_comments, class_name: "PosComment", finder_sql: Proc.new{
		%Q{select * from pos_comments where area_id = #{area_id} and pos_id = #{id} }
	}

	default_scope order("updated_at DESC")


	def brand
		User::BRAND[brand_id.to_s]
	end

	def area
		Area.find(area_id).name
	end
end
