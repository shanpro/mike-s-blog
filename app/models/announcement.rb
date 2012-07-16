# -*- encoding: utf-8 -*-
class Announcement < ActiveRecord::Base
  attr_accessible :content, :is_urgent, :title, :an_type, :section_id
  belongs_to :user

  SECTION = Hash[1, "销售发展公告", 2, "销售战略公告", 3, "销售公告", 4, "美容教育公告", 5, "其他公告"]
end
