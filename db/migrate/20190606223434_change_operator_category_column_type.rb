class ChangeOperatorCategoryColumnType < ActiveRecord::Migration[5.2]
  def change
  change_column :operators, :category, :string
  end
end
