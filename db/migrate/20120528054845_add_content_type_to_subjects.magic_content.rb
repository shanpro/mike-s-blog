# This migration comes from magic_content (originally 20120210101614)
class AddContentTypeToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :content_type, :string

  end
end
