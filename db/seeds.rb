Category.destroy_all
puts "Categories destroyed!"

puts "Create Categories..."
bridge_categories = Bridge::Users::ListAllCategories.call
SaveInDb::Categories.call(bridge_categories)
