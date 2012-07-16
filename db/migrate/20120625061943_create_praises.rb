class CreatePraises < ActiveRecord::Migration
  def change
    create_table :praises do |t|
    	t.string :from
    	t.string :to
    	t.text :content
    	t.integer :user_id
    	t.integer :status
      t.timestamps
    end
  end
end
