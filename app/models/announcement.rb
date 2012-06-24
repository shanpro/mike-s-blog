class Announcement < ActiveRecord::Base
  attr_accessible :content, :is_urgent, :title
  belongs_to :user
end
