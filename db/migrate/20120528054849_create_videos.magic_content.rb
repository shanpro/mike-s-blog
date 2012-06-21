# This migration comes from magic_content (originally 20120214015726)
class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :embed_code
      t.integer :subject_id
      t.has_attached_file :snap
      t.datetime :published_at
      t.timestamps
    end

    add_column :downloads, :published_at, :datetime
  end
end