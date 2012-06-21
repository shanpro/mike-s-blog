# This migration comes from magic_content (originally 20120214135143)
class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :intro
      t.text :content
      t.integer :subject_id
      t.datetime :published_at
      t.has_attached_file :img

      t.timestamps
    end
  end
end
