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

  15.times do
  Character.create!(name: Faker::FamilyGuy.character, motto: Faker::FamousLastWords.last_words, ability_id: rand(1..10))
  end

  15.times do
  Costume.create(name: Faker::Color.color_name)
  end

  15.times do
  User.create(name: Faker::BreakingBad.character, bio: Faker::Dog.breed, location: Faker::WorldCup.city, age: rand(1..10))
  end

  15.times do
  Avatar.create(name: Faker::Dog.name, likes: rand(1..10), user_id: rand(1..10), costume_id: rand(1..10), character_id: rand(1..10) )
  end
