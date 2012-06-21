class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.has_attached_file :avatar
    	t.string :brand_id, :default => 1
    	t.string :area_id, :area_id => 1
    	t.string :role_id
    	t.integer :status
      t.timestamps
    end
  end
end
