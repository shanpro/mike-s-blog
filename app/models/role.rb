# -*- encoding : utf-8 -*-
class Role < ActiveRecord::Base
  attr_accessible :auth, :name
  AUTH = {
            "News" => "新闻",
        "Calendar" => "日历",
    "BestPractice" => "Best Practice",
       "LiveStory" => "生活故事",
           "Sales" => "销售部门",
              "Ba" => "BA",
         "Trainer" => "Trainer",
           "Coach" => "Coach",
         "Product" => "产品"
       }
  validates_presence_of :auth
end
