# This migration comes from magic_admin (originally 20120204174000)
class RemovePermissionIdOfFunctions < ActiveRecord::Migration
  def change
    remove_column :functions, :permission_id
    add_column :admins, :last_logout_at, :timestamp
    add_column :permissions, :can, :integer, :default => 1
  end
end