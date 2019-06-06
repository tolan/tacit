class ChangeBridgeIdType < ActiveRecord::Migration[5.2]
  def change
    change_column :operations, :bridge_id, :bigint
    change_column :accounts, :bridge_id, :bigint
    change_column :banks, :bridge_id, :bigint
    change_column :categories, :bridge_id, :bigint
  end
end
