# This migration comes from magic_content (originally 20120327090532)
class AddColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :content_source, :string
  end
end
