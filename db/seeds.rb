# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

15.times do
Ability.create(name: Faker::Superhero.power)
end

  Character.create!(name: "Mario", motto: Faker::FamousLastWords.last_words)
  Character.create(name: "Princess Peach", motto: Faker::FamousLastWords.last_words)

  Costume.create(name: "Summer")
  Costume.create(name: "Winter")
  Costume.create(name: "Fall")
  Costume.create(name: "Street Fighter")
