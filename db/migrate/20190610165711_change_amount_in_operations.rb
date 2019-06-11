class ChangeAmountInOperations < ActiveRecord::Migration[5.2]
  def change
    remove_column :operations, :amount
    add_monetize :operations, :amount, currency: { present: false }
  end
end
