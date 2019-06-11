require 'json'
require 'open-uri'
require 'csv'

Operation.destroy_all
puts "Operations are destroyed!"

Category.destroy_all
puts "Categories destroyed!"

Subscription.destroy_all

Operator.destroy_all
puts "Categories destroyed!"

User.destroy_all
puts "Users are destroyed!"

# puts "Create Categories..."
# bridge_categories = Bridge::Categories::List.call
# SaveInDb::Categories.call(bridge_categories)


puts "create operators"

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

puts "operators created"


puts "Creating User cyril"
# créer user (User.create) avec le mail de Cyril => cyril
cg = User.create( email: "cyril.gaitte@gmail.com",
                  password: "Password123",
                  first_name: "Cyril",
                  last_name: "Gaitte",
                  household: 4,
                  photo: "data:image/jpeg;base64,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"
                  )

puts "cyril created"

csv_options = { col_sep: ',', headers: :first_row }
filepath    = Rails.root + 'db/cyril_gaitte.csv'

CSV.foreach(filepath, csv_options) do |row|
  # Here, row is an array of columns
  Operation.create(
    user: cg,
    amount: row["amount"],
    date: row["date"],
    description: row["description"]
  )
end
puts "#{cg.first_name}'s conversions added"

puts "create similar users"

1.times do
url = 'https://uinames.com/api/?ext&region=france'

user_serialized = open(url).read
user = JSON.parse(user_serialized)

similar = User.create(  email: user["email"],
                        first_name: user['name'],
                        last_name: user["surname"],
                        password: "Password123",
                        household: 4,
                        photo: user["photo"]
                        )

puts "#{similar.first_name} created"

csv_options = { col_sep: ',', headers: :first_row }
filepath    = Rails.root + 'db/similar_users.csv'

CSV.foreach(filepath, csv_options) do |row|
  # Here, row is an array of columns
  Operation.create(
    user: similar,
    amount: row["amount"],
    date: row["date"],
    description: row["description"]
  )
end

puts "#{similar.first_name}'s conversions added to the database"

end

puts "create single users"

1.times do
url = 'https://uinames.com/api/?ext&region=france'

user_serialized = open(url).read
user = JSON.parse(user_serialized)

single = User.create(  email: user["email"],
                        first_name: user['name'],
                        last_name: user["surname"],
                        password: "Password123",
                        household: 1,
                        photo: user["photo"]
                        )

puts "#{single.first_name} created"

csv_options = { col_sep: ',', headers: :first_row }
filepath    = Rails.root + 'db/single_users.csv'

CSV.foreach(filepath, csv_options) do |row|
  # Here, row is an array of columns
  Operation.create(
    user: single,
    amount: row["amount"],
    date: row["date"],
    description: row["description"]
  )
end
puts "#{single.first_name}'conversions added to the database"
end

puts "processing transactions..."

# bridge_users = Bridge::Users::List.call # lister les user côté Bridge => bridge_users

# bridge_cyril = bridge_users.find {|user| user["email"] == cg.email} # récupérer le bridge_user correspondant à Cyril => bridge_cyril

# cg.uuid = bridge_cyril["uuid"]# récupérer les transactions de bridge_cyril

#   # bridge_cyril_transactions = Bridge::Transactions::List.call(cg)
# # enregistrer les operations et les associées à cyril
# puts "Creating Operations!"
#   SaveInDb::Transactions.call(cg)

# -------------------------------------------------------

#récupère toutes les transactions
transac = Operation.all
#traite les transactions
Converttransaction.call(transac)
puts "Operations transformed into subscriptions!"

puts" __      __                               __                              .___
/  \    /  \ ____     ________ __   ____ |  | __   ______ ____   ____   __| _/
\   \/\/   // __ \   /  ___/  |  \_/ ___\|  |/ /  /  ___// __ \_/ __ \ / __ |
 \        /\  ___/   \___ \|  |  /\  \___|    <   \___ \\  ___/\  ___// /_/ |
  \__/\  /  \___  > /____  >____/  \___  >__|_ \ /____  >\___  >\___  >____ |
       \/       \/       \/            \/     \/      \/     \/     \/     \/
"
# ascii art
