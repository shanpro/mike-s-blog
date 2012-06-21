# This migration comes from magic_admin (originally 20120206170000)
class AddFunctionIdToPermissions < ActiveRecord::Migration
  def change

  	add_column :permissions, :function_id, :integer

  end
end