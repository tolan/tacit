class ChangeColumnType < ActiveRecord::Migration[5.2]
  def change
    change_column :operators, :unsubcribe_details, :text
  end
end
