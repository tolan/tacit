class AddPriceToOperations < ActiveRecord::Migration[5.2]
  def change
    add_monetize :operations, :price, currency: { present: false }
  end
end
