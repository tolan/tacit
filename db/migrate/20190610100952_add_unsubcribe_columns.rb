class AddUnsubcribeColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :operators, :unsubcribe_letter, :string
  end
end
