# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
house = House.new(address: "101 Seattle Way, 98119")
area = Area.new(name: "living room")
area2 = Area.new(name: "bathroom")
area3 = Area.new(name: "hallway")
project = Project.new(name: "paint walls", status: "not started")
project2 = Project.new(name: "fix toilet", status: "in progress")
material = Material.new(name: "white paint", quantity_on_hand: "2", unit: "gallon", value_per_unit: "25")
material2 = Material.new(name: "supply hose", quantity_on_hand: "1", unit: "hose", value_per_unit: "4")
material3 = Material.new(name: "teflon tape", quantity_on_hand: "1", unit: "roll", value_per_unit: "2")
house.areas << area
house.areas << area2
house.areas << area3
house.projects << project
house.projects << project2
house.save
material.save
material2.save
material3.save
user = User.create!(email: "bob_jones@home.com", password: "simple_stuff_123")
