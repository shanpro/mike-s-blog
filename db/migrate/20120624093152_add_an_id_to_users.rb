class AddAnIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :an_id, :integer
  end
end
