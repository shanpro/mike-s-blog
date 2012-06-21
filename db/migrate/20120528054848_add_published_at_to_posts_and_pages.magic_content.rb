# This migration comes from magic_content (originally 20120213063118)
class AddPublishedAtToPostsAndPages < ActiveRecord::Migration
  def change
    add_column :posts, :published_at, :datetime
    add_column :pages, :published_at, :datetime
  end
end
