# This migration comes from magic_content (originally 20120217045845)
class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :position
      t.string :desc
      t.string :key
      t.has_attached_file :img
      t.string :media_type
      t.string :media_format
      t.integer :width
      t.integer :height
      t.integer :maximum_size
      t.boolean :enabled
      t.boolean :require_approve

      t.timestamps
    end
  end
end
