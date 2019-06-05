class CreateOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :operations do |t|
      t.string :description
      t.integer :amount
      t.date :date
      t.integer :bridge_id
      t.references :user, foreign_key: true
      t.references :subscription, foreign_key: true
      t.references :category, foreign_key: true
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
