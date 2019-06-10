class FixPreviousMigration < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :household, :integer
    add_column :users, :photo, :string
    remove_column :accounts, :first_name
    remove_column :accounts, :last_name
    remove_column :accounts, :household
  end
end
