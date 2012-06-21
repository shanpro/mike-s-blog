# This migration comes from magic_admin (originally 20120202160501)
class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :admin_id
      t.string :name

      t.timestamps
    end
  end
end
