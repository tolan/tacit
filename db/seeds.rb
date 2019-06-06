Category.destroy_all
Operator.destroy_all
puts "Categories destroyed!"

puts "Create Categories..."
bridge_categories = Bridge::Users::ListAllCategories.call
SaveInDb::Categories.call(bridge_categories)

puts "create operators"

amazon = Operator.create(
  name: "Amazon",
  regex: "Amazon.fr/prem",
  category: "Shopping",
  logo: 'logos/amazon.png'
  )

bouygues = Operator.create(
  name: "Bouygues Telecom",
  regex: "Bouygues Telecom",
  category: "Telco",
  logo: 'logos/bouygues.png'
  )

canal = Operator.create(
  name: "Canal+",
  regex: "Canalsat",
  category: "Entertainment",
  logo: 'logos/canal.png'
  )

edf = Operator.create(
  name: "Edf",
  regex: "Edf ",
  category: "Energie",
  logo: 'logos/edf.png'
  )

engie = Operator.create(
  name: "Engie",
  regex: "Engie",
  category: "Energie",
  logo: 'logos/engie.png'
  )

engiehs = Operator.create(
  name: "Engie Home Services",
  regex: "Engie Home Services",
  category: "Home Services",
  logo: 'logos/engiehs.png'
  )

freem = Operator.create(
  name: "Free Mobile",
  regex: "Free Mobile",
  category: "Telco",
  logo: 'logos/freem.png'
  )

freei = Operator.create(
  name: "Free internet",
  regex: "Free Telecom",
  category: "Telco",
  logo: 'logos/freem.png'
  )

orange = Operator.create(
  name: "Orange",
  regex: "Orange",
  category: "Telco",
  logo: 'logos/orange.png'
  )

securitas = Operator.create(
  name: "Securitas",
  regex: "Securitas",
  category: "Home Services",
  logo: 'logos/securitas.png'
  )

spotify = Operator.create(
  name: "Spotify",
  regex: "Spotify",
  category: "Entertainment",
  logo: 'logos/spotify.png'
  )

suez = Operator.create(
  name: "Suez",
  regex: "Suez Eau",
  category: "Energie",
  logo: 'logos/suez.jpg'
  )

axah = Operator.create(
  name: "Axa habitation",
  regex: "Axa France Vie",
  category: "Assurance",
  logo: 'logos/axa.png'
  )

axaa = Operator.create(
  name: "Axa auto",
  regex: "Prlv De Axa",
  category: "Assurance",
  logo: 'logos/axa.png'
  )
