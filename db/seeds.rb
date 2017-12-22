# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
house = House.new(address: "101 Seattle Way, 98119")
project = Project.new(name: "paint walls")
project2 = Project.new(name: "fix toilet", status: "in progress")
material = Material.create(name: "white paint", quantity_on_hand: "2", unit: "gallon", value_per_unit: "25")
material2 = Material.create(name: "supply hose", quantity_on_hand: "1", unit: "hose", value_per_unit: "4")
material3 = Material.create(name: "teflon tape", quantity_on_hand: "1", unit: "roll", value_per_unit: "2")
material4 = Material.create(name: "paint brush", quantity_on_hand: "2", unit: "each", value_per_unit: "3")
house.projects << project
house.projects << project2
house.save
user = User.create!(email: "bob_jones@home.com", password: "simple_stuff_123")
project.items.create(material_id: material.id, quantity: 1)
project.items.create(material_id: material4.id, quantity: 1)
project2.items.create(material_id: material2.id, quantity: 2)
project2.items.create(material_id: material3.id, quantity: 1)
