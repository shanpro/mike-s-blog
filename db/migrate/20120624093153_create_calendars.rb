class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      #t.integer  :topic_id
      t.string   :title
      t.text     :content
      t.string   :url
      t.boolean  :allday, :default => 0
      t.datetime :start
      t.datetime :end


      t.timestamps
    end
  end
end
