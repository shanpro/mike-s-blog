# -*- encoding: utf-8 -*-
class Calendar < ActiveRecord::Base
  has_one :topic
end
