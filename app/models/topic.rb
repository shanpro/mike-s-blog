require "oci8"
class Topic < ActiveRecord::Base
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

  def self.import_old_data
    Topic.destroy_all
    a = OCI8.new('gposuser62', 'usergpos', '10.129.30.83:1527/APOS')
    sql = "SELECT * FROM GBBS02MT"
    a.exec(sql) do |row|
      topic = Topic.new
      user = User.find_by_login(row[6])
      boradid = row[0].to_f

      if user.blank?
        topic.user_id = 0
      else
        topic.user_id = user.id
      end
      case boradid
      when 37
        topic.section_id = 22
      when 11
        topic.section_id = 16   
      when 12
        topic.section_id = 8
      when 16
        topic.section_id = 12
      when 17
        topic.section_id = 21
      when 18
        topic.section_id = 13
      when 19
        topic.section_id = 11
      when 21
        topic.section_id = 10
      when 25
        topic.section_id = 18
      when 26
        topic.section_id = 23
      when 28
        topic.section_id = 23
      when 34
        topic.section_id = 24
      end

      topic.brand_id = nil

      topic.title = row[5]
      topic.content = row[9].read
      topic.status = 1
      topic.view_count = row[7]
      topic.created_at = row[13]
      if row[15].blank?
        topic.updated_at = Time.now
      else
      	topic.updated_at = row[15]
      end
      if (row[0].to_i == 34 and row[1].to_i == 9200) || row[6].to_i == '20070295' || row[6].to_i == '20070246'
	     next
      end
      
      p row[1].to_i
      begin
        topic.save
      rescue
        puts "error"
      end
      puts topic.title

    end
  end

end
