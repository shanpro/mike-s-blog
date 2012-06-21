# This migration comes from magic_admin (originally 20120201084146)
class AddAlipayAccountToAdminProfiles < ActiveRecord::Migration
  def change
    add_column :admin_profiles, :alipay_account, :string
    add_column :admin_profiles, :mobile, :string
    add_column :admin_profiles, :phone, :string
    add_column :admin_profiles, :address, :string
  end
end
