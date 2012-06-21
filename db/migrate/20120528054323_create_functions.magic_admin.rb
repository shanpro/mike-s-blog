# This migration comes from magic_admin (originally 20120204091412)
class CreateFunctions < ActiveRecord::Migration
  def change
    create_table :functions do |t|
      t.string :name
      t.integer :can
      t.integer :permission_id

      t.timestamps
    end
  end
end
