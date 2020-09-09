require 'faker'

10.times do
    Hero.new(name: Faker::Name.name_with_middle, alter_ego: Faker::Superhero.name, super_power: Faker::Superhero.power, power_lvl: Faker::Number.within(range: 50..300), resistance: Faker::Number.within(range: 1..40), hp: Faker::Number.within(range: 500..1000), gender: Faker::Gender.binary_type, race: Faker::Games::DnD.species, origin_story: Faker::Lorem.paragraphs(number: 3), nemesis: nil)
end

10.times do
    Villain.new(name: Faker::Name.name_with_middle, alter_ego: Faker::Superhero.name, super_power: Faker::Superhero.power, power_lvl: Faker::Number.within(range: 50..300), resistance: Faker::Number.within(range: 1..40), hp: Faker::Number.within(range: 500..1000), gender: Faker::Gender.binary_type, race: Faker::Games::DnD.species, origin_story: Faker::Lorem.paragraphs(number: 3), nemesis: nil, grievance: Faker::Verb.base, insane_asylum: Faker::Boolean.boolean, mental_health: Faker::Number.within(range: 1..10))
end

binding.pry
puts 0