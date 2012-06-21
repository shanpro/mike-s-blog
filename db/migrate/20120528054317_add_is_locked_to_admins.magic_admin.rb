# This migration comes from magic_admin (originally 20120202160500)
class AddIsLockedToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :is_locked, :integer
  end
end