class AddAccountslogocolumns < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :logo, :string
  end
end
