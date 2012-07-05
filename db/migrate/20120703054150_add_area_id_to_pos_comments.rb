class AddAreaIdToPosComments < ActiveRecord::Migration
  def change
  	add_column :pos_comments, :area_id, :integer
  end
end
