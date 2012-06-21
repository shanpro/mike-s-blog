class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.text :desc
      t.integer :parent_id
      t.integer :demo_id
      t.boolean :is_show
      t.boolean :is_recommend

      t.timestamps
    end
  end
end
