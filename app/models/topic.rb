class Topic < ActiveRecord::Base
  attr_accessible :assign_brand, :assign_group, :brand_id, :content, :is_good, :is_honour, :section_id, :status, :title, :view_count

end
