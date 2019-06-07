# Category.destroy_all
Operation.destroy_all
Subscription.destroy_all
Operator.destroy_all
puts "Categories destroyed!"

# puts "Create Categories..."
# bridge_categories = Bridge::Users::ListAllCategories.call
# SaveInDb::Categories.call(bridge_categories)

puts "create operators"

require 'csv'

csv_options = { col_sep: ',', headers: :first_row }
filepath    = Rails.root + 'db/operators.csv'

CSV.foreach(filepath, csv_options) do |row|
  # Here, row is an array of columns
  Operator.create(
    name: row["name"],
    regex: row["regex"],
    category: row["category"],
    logo: row["logo"]
  )
end

