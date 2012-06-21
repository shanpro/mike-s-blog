class AddSectionNameToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :section_name, :string
  end
end
