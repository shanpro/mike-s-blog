# -*- encoding: utf-8 -*-
class Section < ActiveRecord::Base
  attr_accessible :demo_id, :desc, :is_recommend, :is_show, :parent_id, :title, :eng_name
  validates_uniqueness_of :eng_name, :message => "英文名重复"
  has_many :news
end
