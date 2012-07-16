class AddSectionIdToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :section_id, :integer
  end
end
