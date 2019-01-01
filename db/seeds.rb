# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Card.destroy_all
User.destroy_all
Transaction.destroy_all

user1 = User.create(name: "Jesus Escalona", username: "eyisus", password: "123456", balance: 1000)
user2 = User.create(name: "Veronica", username: "vero", password: "1234")
User.create(name: "Patricio", username: "pat", password: "123pat")
User.create(name: "Frank", username: "frank", password: "123frank")

Card.create(user: user1, card_number: "4287123973598366", security_code: 600, card_type: "visa", zip_code: 33178, exp_date: DateTime.strptime("02/2019", "%m/%Y"))
t1 = Transaction.create(sender: user1, receiver: user2, amount: 200, message: "For you my love 😍 💵💸")