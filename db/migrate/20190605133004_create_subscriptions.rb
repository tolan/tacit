class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.integer :frequency
      t.date :anniversary_date
      t.date :next_date
      t.references :operator, foreign_key: true

      t.timestamps
    end
  end
end
