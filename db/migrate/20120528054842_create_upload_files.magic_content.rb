# This migration comes from magic_content (originally 20120201032456)
class CreateUploadFiles < ActiveRecord::Migration
  def change
    create_table :upload_files do |t|
      t.string :filedata_file_name
      t.string :filedata_content_type
      t.integer :filedata_file_size
      t.datetime :filedata_updated_at
      t.timestamps
    end
  end
end
