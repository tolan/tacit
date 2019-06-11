class AddBankDetailsToOperators < ActiveRecord::Migration[5.2]
  def change
    add_column :operators, :bank_name, :string
    add_column :operators, :bank_logo, :string
  end
end
