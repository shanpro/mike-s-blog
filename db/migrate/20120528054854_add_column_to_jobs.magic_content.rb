# This migration comes from magic_content (originally 20120216020051)
class AddColumnToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :subject_id, :integer

  end
end
