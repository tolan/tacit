class AddCategoryLogoToOperators < ActiveRecord::Migration[5.2]
  def change
    add_column :operators, :category_logo, :string
  end
end
