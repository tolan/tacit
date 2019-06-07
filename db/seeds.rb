Operation.destroy_all
puts "Operations are destroyed!"

Category.destroy_all
puts "Categories destroyed!"

puts "Create Categories..."
bridge_categories = Bridge::Categories::List.call
SaveInDb::Categories.call(bridge_categories)

User.destroy_all
puts "Users are destroyed!"

puts "Creating Users!"
# créer user (User.create) avec le mail de Cyril => cyril
cg = User.create(email: "cyril.gaitte@gmail.com", password: "Password123")

# lister les user côté Bridge => bridge_users
bridge_users = Bridge::Users::List.call
# récupérer le bridge_user correspondant à Cyril => bridge_cyril
bridge_cyril = bridge_users.find {|user| user["email"] == cg.email}

#   récupérer le uuid de bridge_cyril et l'enregister dans cyril
cg.uuid = bridge_cyril["uuid"]
# récupérer les transactions de bridge_cyril
  # bridge_cyril_transactions = Bridge::Transactions::List.call(cg)
# enregistrer les operations et les associées à cyril
puts "Creating Operations!"
  SaveInDb::Transactions.call(cg)
puts "Operations Saved The Database!"
