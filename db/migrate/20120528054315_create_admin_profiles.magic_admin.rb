# This migration comes from magic_admin (originally 20120201070817)
class CreateAdminProfiles < ActiveRecord::Migration
  def change
    create_table :admin_profiles do |t|
      t.integer :admin_id
      t.string :username
      t.string :name
      t.integer :login_times
      t.string :last_login_ip

      t.timestamps
    end
  end
end
