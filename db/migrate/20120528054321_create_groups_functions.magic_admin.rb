# This migration comes from magic_admin (originally 20120203063231)
class CreateGroupsFunctions < ActiveRecord::Migration
  def change

    create_table :groups_functions do |t|
      t.integer :group_id
      t.integer :function_id

      t.timestamps
    end
  end
end
