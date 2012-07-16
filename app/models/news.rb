# -*- encoding: utf-8 -*-
class News < ActiveRecord::Base
	self.table_name = "topics"

	has_many :comments, foreign_key: "topic_id"
	belongs_to :user
	belongs_to :section
	has_many :topic_logs, foreign_key: "topic_id"

	validates_presence_of :title, message: "标题不能为空"
	validates_presence_of :content, message: "内容不能为空"
	default_scope order("updated_at DESC")

	paginates_per 10

  has_attached_file :img,
  	# :whiny_thumbnails => true,
  	:styles => {:normal => "96x87#"},
  	:url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
  	:path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

  has_attached_file :video,
  	:url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
  	:path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

  has_attached_file :file,
	  :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
  	:path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"


	scope :all_datas, where(section_name: "news", status: 1)
	scope :brand_news, lambda{ |brand| where(section_name: "news", brand_id: brand)}

	def brand
		User::BRAND[brand_id.to_s]
	end


end
