class AddEngNameToSection < ActiveRecord::Migration
  def change
    add_column :sections, :eng_name, :string
  end
end
