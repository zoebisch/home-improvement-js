# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
house = House.create([{ address: "101 Seattle Way, 98119"}])
area = Area.new([{name: "living room"}])
area2 = Area.new([{name: "bathroom"}])
area3 = Area.new([{name: "hallway"}])
project = Project.new([{name: "paint walls", status: "not started"}])
project2 = Project.new([{name: "fix toilet"}])
material = Material.create([{name: "white paint", quantity_on_hand: "2", unit: "gallon", value_per_unit: "25"}])
material2 = Material.create([{name: "supply hose", quantity_on_hand: "1", unit: "hose", value_per_unit: "4"}])
material3 = Material.create([{name: "teflon tape", quantity_on_hand: "1", unit: "roll", value_per_unit: "2"}])
binding.pry
house.areas << area
house.areas << area2
house.areas << area3
