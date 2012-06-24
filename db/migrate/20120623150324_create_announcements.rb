class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.integer :user_id
      t.string  :title
      t.text    :content
      t.boolean :is_urgent, :default => 0
      t.boolean :an_type, :default => 1 # public => 1

      t.timestamps
    end
  end
end
