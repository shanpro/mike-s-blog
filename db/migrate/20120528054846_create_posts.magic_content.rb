# This migration comes from magic_content (originally 20120210153014)
class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.text :intro
      t.text :body
      t.integer :admin_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
