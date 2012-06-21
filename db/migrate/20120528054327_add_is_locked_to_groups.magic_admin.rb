# This migration comes from magic_admin (originally 20120206122700)
class AddIsLockedToGroups < ActiveRecord::Migration
  def change
  	add_column :groups, :is_locked, :integer
  end
end