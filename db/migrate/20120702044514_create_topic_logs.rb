class CreateTopicLogs < ActiveRecord::Migration
  def change
    create_table :topic_logs do |t|
    	t.integer :user_id
    	t.datetime :operated_at
    	t.string :operated_type
    	t.integer :topic_id
      t.timestamps
    end
  end
end
