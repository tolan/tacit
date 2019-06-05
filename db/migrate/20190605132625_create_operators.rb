class CreateOperators < ActiveRecord::Migration[5.2]
  def change
    create_table :operators do |t|
      t.string :name
      t.integer :category
      t.integer :unsubcribe_number
      t.string :unsubcribe_details
      t.string :unsubcribe_address
      t.string :logo

      t.timestamps
    end
  end
end
