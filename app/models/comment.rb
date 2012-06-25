# -*- encoding:utf-8 -*-
class Comment < ActiveRecord::Base
  belongs_to :news
  belongs_to :user
  has_many :replies, class_name: "Comment", foreign_key: "reply_id"
  default_scope order("created_at DESC")
end
