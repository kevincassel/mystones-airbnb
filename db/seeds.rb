# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroy all users and stones"
Stone.destroy_all
User.destroy_all

puts "Create Users"

User.create!(first_name: "Manon", last_name: "nonon", username: "Nionion", age:"23", phone_number:"0739403920", address:"2 Rue Polnareff, 59000 Lille", email: "mamama@gmail.com", password:"mamama", description:"Je suis gentil")
User.create!(first_name: "Pierre", last_name: "Quiroule", username: "Plouf", age:"35", phone_number:"0630293049", address:"54 Boulavard de la pierre, 62100 Calais", email: "papapa@gmail.com", password:"papapa", description:"J'aime les pierres")

puts "Create Stones"

Stone.create!(user: User.first, name:"Patrick", category:"Ruby", age:"37", weight:"2.8", gender:"no-binary", size:"3.5", sensation:"smooth", price:"15.3", address:"3 rue du colonel Pollet", zip:"59000", town:"Lille", country:"France", description:"jolie")
Stone.create!(user: User.first, name:"Cléo", category:"Basalt", age:"107", weight:"5.7", gender:"Woman", size:"12", sensation:"rough", price:"1.5", address:"190 boulevard du petit poney", zip:"62100", town:"Calais", country:"France", description:"magnifique")
Stone.create!(user: User.last, name:"Line", category:"Emeraud", age:"59", weight:"3.6", gender:"no-binary", size:"24", sensation:"smooth", price:"3.2", address:"49 avenue de l'Europe", zip:"75000", town:"Paris", country:"France", description:"parfait pour dormir dessus")
Stone.create!(user: User.last, name:"Pierre", category:"Sapphir", age:"503", weight:"10.5", gender:"Man", size:"43", sensation:"rough", price:"139.6", address:"405 route du tavernier", zip:"59370", town:"Calais", country:"France", description:"j'aime rouler avec ma pierre")

puts "Finished !"
