class Calendar < ActiveRecord::Base
  # 时间差8小时
  has_one :topic
end