class AddRecommendCountToPraises < ActiveRecord::Migration
  def change
    add_column :praises, :recommend_count, :integer
  end
end
