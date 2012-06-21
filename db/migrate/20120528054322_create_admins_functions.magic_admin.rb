# This migration comes from magic_admin (originally 20120204085720)
class CreateAdminsFunctions < ActiveRecord::Migration
  def change

    create_table :admins_functions do |t|
      t.integer :admin_id
      t.integer :function_id

      t.timestamps
    end
  end
end
