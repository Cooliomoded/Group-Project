class Battle < ActiveRecord::Base
    belongs_to :hero
    belongs_to :villain

    #destroys the hero, the hero lost and died 
    def hero_lost(hero)
        if hero.hp <= 0
            hero.destroy
        end
    end

    #villain loses battle, gets sent to insane asylum
    def villain_lost(villain)
        if villain.hp <= 0
            villain.update(insane_asylum: true)
        end
    end

    #changes the destruction severity of a battle, if there is a a fair amount of damage, a hero is created. If a lot, create villain.
    def destruction 
        self.update(destruction: true)
        self.update(destruction_severity: rand(1.0..10.0))
        if destruction_severity >= 6.0
            self.update(hero_created: true)
            Hero.create(name: Faker::Name.name_with_middle, alter_ego: Faker::Superhero.name, super_power: Faker::Superhero.power, power_lvl: Faker::Number.within(range: 50..300), resistance: Faker::Number.within(range: 1..40), hp: Faker::Number.within(range: 500..1000), gender: Faker::Gender.binary_type, race: Faker::Games::DnD.species, origin_story: Faker::Lorem.paragraphs(number: 3), nemesis: nil)
            puts "Through the wreckage, a new person found their purpose in life. A new hero emerges!"
        elsif destruction_severity >= 8.0
            self.update(villain_created: true)
            Villain.create(name: Faker::Name.name_with_middle, alter_ego: hero.nemesis, super_power: Faker::Superhero.power, power_lvl: Faker::Number.within(range: 50..300), resistance: Faker::Number.within(range: 1..40), hp: Faker::Number.within(range: 500..1000), gender: Faker::Gender.binary_type, race: Faker::Games::DnD.species, origin_story: Faker::Lorem.paragraphs(number: 3), nemesis: nil, grievance: Faker::Verb.base, insane_asylum: false, mental_health: Faker::Number.within(range: 1..10))
            puts "The world is coming into more chaos. There are riots everywhere, might as well cause more mayhem!! A new villain emerges!"
        end
    end

    #creates a battle with your hero and a random villain
    def self.start_a_battle(hero, villain)
        Battle.create(location: Faker::Address.city, date: Faker::Date.between(from: 10.days.ago, to: Date.today), hero_id: Hero.find(hero.id), villain_id: Villain.find(villain.id), hero_win: nil, destruction: nil, destruction_severity: nil, hero_created: false, villain_created: false)
    end




end