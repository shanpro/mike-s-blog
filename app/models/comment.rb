# -*- encoding:utf-8 -*-
class Comment < ActiveRecord::Base
  belongs_to :news
end
