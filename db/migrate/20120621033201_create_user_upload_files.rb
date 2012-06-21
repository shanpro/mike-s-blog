class CreateUserUploadFiles < ActiveRecord::Migration
  def change
    create_table :user_upload_files do |t|
    	t.string :section_name	
    	t.has_attached_file :source
    	t.integer :section_id
      t.timestamps
    end
  end
end
