class CreatePosComments < ActiveRecord::Migration
  def change
    create_table :pos_comments do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :section_id
      t.integer :pos_id

      t.timestamps
    end
  end
end
