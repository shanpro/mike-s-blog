# This migration comes from magic_admin (originally 20120222144000)
class RemoveCanOfFunctions < ActiveRecord::Migration
  def change
    remove_column :functions, :can
  end
end