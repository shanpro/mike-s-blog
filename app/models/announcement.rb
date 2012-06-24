# -*- encoding: utf-8 -*-
class Announcement < ActiveRecord::Base
  attr_accessible :content, :is_urgent, :title, :an_type
  belongs_to :user
end
