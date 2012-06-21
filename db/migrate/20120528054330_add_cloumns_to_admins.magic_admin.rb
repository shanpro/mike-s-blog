# This migration comes from magic_admin (originally 20120208150836)
class AddCloumnsToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :username, :string
    remove_column :admin_profiles, :username
  end
end
