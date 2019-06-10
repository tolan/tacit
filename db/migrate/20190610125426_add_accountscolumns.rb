class AddAccountscolumns < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :photo, :string
    add_column :accounts, :first_name, :string
    add_column :accounts, :last_name, :string
    add_column :accounts, :household, :integer
  end
end
