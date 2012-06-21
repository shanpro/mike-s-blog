# This migration comes from magic_admin (originally 20120204103800)
class AddFunctionCategoryIdToFunctions < ActiveRecord::Migration
  def change

  	add_column :functions, :function_category_id, :integer

  end
end