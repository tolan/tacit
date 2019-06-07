class ChangeAmountToFloat < ActiveRecord::Migration[5.2]
    def change
   change_column :operations, :amount, :float
  end
end
