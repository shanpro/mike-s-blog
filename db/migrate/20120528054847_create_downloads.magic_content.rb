# This migration comes from magic_content (originally 20120213044521)
class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.string :title
      t.integer :subject_id
      t.has_attached_file :preview_img
      t.has_attached_file :detail_img
      t.has_attached_file :file
      t.timestamps
    end
  end
end
