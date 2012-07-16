class AddCalendarIdToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :calendar_id, :integer
  end
end
