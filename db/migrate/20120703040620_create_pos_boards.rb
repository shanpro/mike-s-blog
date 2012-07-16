class CreatePosBoards < ActiveRecord::Migration
  def change
    create_table :pos_boards do |t|
    	t.string :title
    	t.text :content
    	t.integer :user_id
    	t.integer :status
    	t.integer :brand_id
    	t.integer :section_id 
    	t.integer :view_count, :default => 0
    	t.integer :category_id
      t.timestamps
    end
  end
end
