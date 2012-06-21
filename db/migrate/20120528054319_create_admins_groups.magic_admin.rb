# This migration comes from magic_admin (originally 20120202160502)
class CreateAdminsGroups < ActiveRecord::Migration
  def change
    create_table :admins_groups do |t|
      t.integer :admin_id
      t.integer :group_id

      t.timestamps
    end
  end
end
