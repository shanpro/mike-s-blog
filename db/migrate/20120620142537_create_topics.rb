class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :content
      t.integer :assign_group
      t.integer :brand_id
      t.boolean :is_honour
      t.boolean :is_good
      t.integer :status
      t.integer :section_id
      t.integer :view_count, :default => 0
      t.integer :assign_brand

      t.timestamps
    end
  end
end
