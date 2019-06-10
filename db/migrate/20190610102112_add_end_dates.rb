class AddEndDates < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :end_date, :date
  end
end
