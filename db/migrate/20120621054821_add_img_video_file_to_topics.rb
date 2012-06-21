class AddImgVideoFileToTopics < ActiveRecord::Migration
  def change
  	add_column :topics, :img_file_name, :string
  	add_column :topics, :img_content_type, :string
  	add_column :topics, :img_file_size, :integer
  	add_column :topics, :img_updated_at, :datetime
  	add_column :topics, :video_file_name, :string
  	add_column :topics, :video_content_type, :string
  	add_column :topics, :video_file_size, :integer
  	add_column :topics, :video_updated_at, :datetime
  	add_column :topics, :file_file_name, :string
  	add_column :topics, :file_content_type, :string
  	add_column :topics, :file_file_size, :integer
  	add_column :topics, :file_updated_at, :datetime
  end
end
