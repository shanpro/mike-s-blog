class CreateBpCases < ActiveRecord::Migration
  def change
    create_table :bp_cases do |t|
    	t.string :title
    	t.text :content
    	t.integer :section_id
    	t.integer :brand_id
    	t.integer :view_count, default: 0
    	t.integer :user_id
			t.string :img_file_name
			t.string :img_content_type
			t.integer :img_file_size
			t.string :video_file_name
			t.string :video_content_type
			t.integer :video_file_size
			t.string :attitude_results
			t.string :sale_results
			t.integer :status
      t.timestamps
    end
  end
end
