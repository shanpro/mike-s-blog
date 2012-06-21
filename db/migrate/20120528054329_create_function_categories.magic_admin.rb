# This migration comes from magic_admin (originally 20120206170002)
class CreateFunctionCategories < ActiveRecord::Migration
  def change
    create_table :function_categories do |t|
      t.string :name
      t.integer :function_id

      t.timestamps
    end
  end
end