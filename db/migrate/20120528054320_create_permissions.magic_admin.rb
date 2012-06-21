# This migration comes from magic_admin (originally 20120203063145)
class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :name
      t.string :action
      t.string :subject_class
      t.integer :subject_id

      t.timestamps
    end
  end
end
