# This migration comes from magic_content (originally 20120509033853)
class AddCountsToDownloads < ActiveRecord::Migration
  def change
    add_column :downloads, :counts, :integer
  end
end
