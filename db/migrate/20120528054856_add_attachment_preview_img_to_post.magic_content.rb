# This migration comes from magic_content (originally 20120322125128)
class AddAttachmentPreviewImgToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :preview_img_file_name, :string
    add_column :posts, :preview_img_content_type, :string
    add_column :posts, :preview_img_file_size, :integer
    add_column :posts, :preview_img_updated_at, :datetime
  end

  def self.down
    remove_column :posts, :preview_img_file_name
    remove_column :posts, :preview_img_content_type
    remove_column :posts, :preview_img_file_size
    remove_column :posts, :preview_img_updated_at
  end
end
