# This migration comes from magic_content (originally 20120201032652)
class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :slug
      t.text :intro
      t.text :content
      t.integer :admin_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
