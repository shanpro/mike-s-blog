class AddKoToSections < ActiveRecord::Migration
  def change
  	add_column :sections, :ko, :string
  end
end
