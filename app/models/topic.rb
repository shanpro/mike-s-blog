class Topic < ActiveRecord::Base
  attr_accessible :assign_brand, :assign_group, :brand_id, :content, :is_good, :is_honour, :section_id, :status, :title, :view_count, :calendar_id, :img
  belongs_to :calendar
  has_attached_file :img,
    # :whiny_thumbnails => true,
    :styles => {:normal => "96x87#"},
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

  has_attached_file :video,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

  has_attached_file :file,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"
end
