class AddRegexToOPerators < ActiveRecord::Migration[5.2]
  def change
    add_column :operators, :regex, :string
  end
end
