# This migration comes from magic_content (originally 20120216012642)
class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :job
      t.string :local
      t.string :company
      t.string :department
      t.string :edu_bg
      t.integer :number
      t.datetime :begin_time
      t.datetime :stop_time
      t.string :email
      t.text :descript

      t.timestamps
    end
  end
end
