class AddCounterAndBaToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :counter, :string
  	add_column :users, :user_ba, :string
  end
end
