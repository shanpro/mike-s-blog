# This migration comes from magic_content (originally 20120324061230)
class AddCloumnToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :work_experience, :string
  end
end
