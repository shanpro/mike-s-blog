# This migration comes from magic_admin (originally 20120204093644)
class CreateFunctionsPermissions < ActiveRecord::Migration
  def change
    create_table :functions_permissions do |t|
      t.integer :function_id
      t.integer :permission_id

      t.timestamps
    end
  end
end
