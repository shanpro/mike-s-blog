class AddSectionIdToPraises < ActiveRecord::Migration
  def change
  	add_column :praises, :section_id, :integer
  end
end
