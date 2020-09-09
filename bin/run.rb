require_relative '../config/environment'

    def greeting
        puts "Welcome to the Hero Battle Simulator."
        puts "Press 1 to play as a Hero. Press 2 to play as a Villain."
        choice = gi_integer
            if choice == 1
                hero_setup
            elsif choice == 2
                villain_setup
            else puts "Sorry, please enter either 1 or 2."
                greeting
            end
    end

    def hero_setup
        puts "Press 1 to choose a Hero. Press 2 to generate your own Hero. Press 3 to go back."
        choice = gi_integer
            if choice == 1
                choose_hero
            elsif choice == 2
                generate_hero_name
            elsif choice == 3
                greeting
            else puts "Sorry, please enter either 1, 2, or 3."
                hero_setup
            end
    end

    def villain_setup
        puts "Press 1 to choose a Villain. Press 2 to generate your own Villain. Press 3 to go back."
        choice = gi_integer
            if choice == 1
                choose_villain
            elsif choice == 2
                generate_villain_name
            elsif choice == 3
                greeting
            else puts "Sorry, please enter either 1, 2, or 3."
                villain_setup
            end
    end
    
    def gi_integer
        gets.chomp.to_i
    end

    def gi_true_false
        gets.chomp.downcase
    end

    def gi_string
        gets.chomp
    end

    def display_heros
        i = 1
        Hero.all.each {|hero| puts "#{i}. " + hero.alter_ego}
        i + 1
    end

    def display_villains
        i = 1
        Villain.all.each {|villain| puts "#{i}. " + villain.alter_ego}
        i + 1
    end

    def choose_hero
        display_heros
        puts "Choose a Hero by typing the number they are labeled with into your console."
        choice = gi_integer - 1
        if choice <= Hero.all.length
            puts "You chose: #{Hero.all[choice]}"
        else puts "Your choice does not exist. Press 1 to rechoose, Press 2 to generate a Hero, Press 3 to go back."
            choice = gi_integer
            if choice == 1
                choose_hero
            elsif choice == 2
                generate_hero
            elsif choice == 3
                hero_setup
            end
        end
    end

    def choose_villain
        display_villains
        puts "Choose a Villain by typing the number they are labeled with into your console."
        choice = gi_integer - 1
        if choice <= Villain.all.length
            puts "You chose: #{Villain.all[choice]}"
        else puts "Your choice does not exist. Press 1 to rechoose, Press 2 to generate a Hero, Press 3 to go back."
            choice = gi_integer
            if choice == 1
                choose_villain
            elsif choice == 2
                generate_villain
            elsif choice == 3
                villain_setup
            end
        end
    end

    def generate_villain_name
        villain = Villain.new
        puts "What is your villain's given name?"
        choice = gi_string
        villain.name = choice
        puts "#{villain.name} is the name you chose. If this is correct, press 1? Press 2 if not. Press 3 to go back."
        choice = gi_integer
            if choice == 1
                generate_villain_alter_ego(hero)
            elsif choice == 2
                generate_villain_name
            elsif choice == 3
                choose_villain
            else puts "Your input was not recognized. Please begin this step again."
                generate_villain_name
            end
    end

    def generate_hero_name
        hero = Hero.new
        puts "What is your hero's given name?"
        choice = gi_string
        hero.name = choice
        puts "#{hero.name} is the name you chose. If this is correct, press 1? Press 2 if not. Press 3 to go back."
        choice = gi_integer
            if choice == 1
                generate_hero_alter_ego(hero)
            elsif choice == 2
                generate_hero_name
            elsif choice == 3
                choose_hero
            else puts "Your input was not recognized. Please begin this step again."
                generate_hero_name
            end
    end

    def generate_hero_alter_ego(hero)
        puts "What is your hero's alter ego?"
        choice = gi_string
        hero.alter_ego = choice
        puts "#{hero.alter_ego} is the alter ego you chose. If this is correct, press 1. Press 2 if not. Press 3 to go back."
        choice = gi_integer
            if choice == 1
                generate_hero_super_power(hero)
            elsif choice == 2
                generate_hero_alter_ego
            elsif choice == 3
                generate_hero_name
            else puts "Your input was not recognized. Please begin this step again."
                generate_hero_alter_ego
            end
    end

    def generate_hero_super_power(hero)
        puts "What is your hero's super power?"
        choice = gi_string
        hero.super_power = choice
        puts "#{hero.super_power} is the power you chose. If this is correct, press 1. Press 2 if not. Press 3 to go back."
        choice = gi_integer
            if choice == 1
                generate_hero_power_level(hero)
            elsif choice == 2
                generate_hero_super_power(hero)
            elsif choice ==3
                generate_hero_alter_ego(hero)
            else puts "Your input was not recognized. Please begin this step again."
                generate_hero_super_power(hero)
            end
    end

    def generate_hero_power_level(hero)
        puts "Your hero's power is being calculated..."
        3.times do
            puts "..."
        end
        power = rand(50..300)
        hero.power_lvl = power
        puts "Your hero's power level is #{hero.power_lvl}"
        puts "Is this enough power? Press 1 if it is enough, press 2 to re-roll power level."
        choice = gi_integer
            if choice == 1
                generate_hero_resistance(hero)
            elsif choice == 2
                generate_hero_power_level(hero)
            else puts "Your input was not recognized. Please begin this step again."
                generate_hero_power_level(hero)
            end
    end

    def generate_hero_resistance(hero)
        puts "Your hero's resistance is being calculated..."
        3.times do
            puts "..."
        end
        resistance = rand(1..40)
        hero.resistance = resistance
        puts "Your hero's resistance is #{hero.resistance}"
        puts "Is that enough resistance? Press 1 if it is enough, press 2 to re-roll power level."
        choice = gi_integer
            if choice == 1
                generate_hero_hp(hero)
            elsif choice == 2
                generate_hero_resistance(hero)
            else puts "Your input was not recognized. Please begin this step again."
                generate_hero_resistance(hero)
            end
    end

    def generate_hero_hp(hero)
        puts "Your hero's hp is being calculated..."
        3.times do
            puts "..."
        end
        hp = rand(500..1000)
        hero.hp = hp
        puts "Your hero's health point are #{hero.hp}"
        puts "Is this enough health? Press 1 if it is enough, press 2 to re-roll power level."
        choice = gi_integer
            if choice == 1
                generate_hero_gender(hero)
            elsif choice == 2
                generate_hero_hp(hero)
            else puts "Your input was not recognized. Please begin this step again."
                generate_hero_hp(hero)
            end
    end

    def generate_hero_gender(hero)
        puts "Is your hero male, female, or any other?"
        choice = gi_string
        hero.gender = choice
        puts "Your hero's gender is #{hero.gender}. If this is correct, press 1. Press 2 if not. Press 3 to go back."
        choice = gi_integer
            if choice == 1
                generate_hero_race(hero)
            elsif choice == 2
                generate_hero_gender(hero)
            elsif choice == 3
                generate_hero_hp(hero)
            else puts "Your input was not recognized. Please begin this step again."
                generate_hero_gender(hero)
            end
    end


    def generate_hero_race(hero)
        puts "What color is your hero?"
        choice = gi_string
        hero.race = choice
        puts "Your hero's race is #{hero.race}. If this is correct, press 1. Press 2 if not. Press 3 to go back."
        choice = gi_integer
            if choice == 1
                generate_hero_origin_story(hero)
            elsif choice == 2
                generate_hero_race(hero)
            elsif choice == 3
                generate_hero_gender(hero)
            else puts "Your input was not recognized. Please begin this step again."
                generate_hero_race(hero)
            end
    end

    def generate_hero_origin_story(hero)
        puts "What is your hero's origin story?"
        choice = gi_string
        hero.origin_story = choice
        puts "Your hero's origins are #{hero.origin_story}. If this is correct, press 1. Press 2 if not. Press 3 to go back."
        choice = gi_integer
            if choice == 1
                generate_hero_nemesis(hero)
            elsif choice == 2
                generate_hero_origin_story(hero)
            elsif choice == 3
                generate_hero_race(hero)
            else puts "Your input was not recognized. Please begin this step again."
            end
    end

    def generate_hero_nemesis(hero)
        puts "Who is your hero's nemesis?"
        choice = gi_string
        hero.nemesis = choice
        puts "Your hero's nemesis is #{hero.nemesis}. If this is correct, press 1. Press 2 if not. Press 3 to go back. Avoid this if you do not want to rewrite your origin story."
        choie = gi_integer
            if choice == 1
                generate_your_hero_battle(hero)
            elsif choice == 2
                generate_hero_nemesis(hero)
            elsif choice == 3
                generate_hero_origin_story(hero)
            else puts "Your input was not recognized. Please begin this step again."
            end
        hero.save
        new_villain = Villain.create(name: hero.nemesis, alter_ego: Faker::Superhero.name, super_power: Faker::Superhero.power, power_lvl: Faker::Number.within(range: 50..300), resistance: Faker::Number.within(range: 1..40), hp: Faker::Number.within(range: 500..1000), gender: Faker::Gender.binary_type, race: Faker::Games::DnD.species, origin_story: Faker::Lorem.paragraphs(number: 3), nemesis: nil, grievance: Faker::Verb.base, insane_asylum: Faker::Boolean.boolean, mental_health: Faker::Number.within(range: 1..10))   
    end

    def generate_your_hero_battle(hero)
        puts "Get ready #{hero.alter_ego}, the people need you!"
        puts "What evil wretch are you going to throw behind bars today?"
        display_villains
        puts "Would you like to fight any of these Villains?"
        puts "If not we can find you a random Villain or you can generate one to fight."
        puts "Press 1 to fight a Villain from the list. Press 2 to generate a Villain. Press 3 to generate a custom Villain."
        gi_integer
            if choice == 1
                choose_villain_from_list
            elsif choice == 2
                Villain.new(name: Faker::Name.name_with_middle, alter_ego: Faker::Superhero.name, super_power: Faker::Superhero.power, power_lvl: Faker::Number.within(range: 50..300), resistance: Faker::Number.within(range: 1..40), hp: Faker::Number.within(range: 500..1000), gender: Faker::Gender.binary_type, race: Faker::Games::DnD.species, origin_story: Faker::Lorem.paragraphs(number: 3), nemesis: nil, grievance: Faker::Verb.base, insane_asylum: Faker::Boolean.boolean, mental_health: Faker::Number.within(range: 1..10))
            elsif choice == 3
                generate_villain_name
            else puts "Your input was not recognized. Please begin this step again."
            end
    end
                
    def generate_your_villain_battle(villain)
        puts "Civilization has been too good for too long. Time to cause some mayhem"
        puts "#{villain.alter_ego} it is your job to cause as much destruction as possible. Which goody two-shoes hero will you humiliate today?"
        display_heros
        puts "You can bully any of these into submission or create another caped-crusader"
        puts "Press 1 to fight a Hero from the list. Press to 2 to generate a Hero. Press 3 to generate a custom Hero"
        gi_integer
            if choice == 1
                choose_hero_from_list
            elsif choice == 2
                Hero.newname: Faker::Name.name_with_middle, alter_ego: Faker::Superhero.name, super_power: Faker::Superhero.power, power_lvl: Faker::Number.within(range: 50..300), resistance: Faker::Number.within(range: 1..40), hp: Faker::Number.within(range: 500..1000), gender: Faker::Gender.binary_type, race: Faker::Games::DnD.species, origin_story: Faker::Lorem.paragraphs(number: 3), nemesis: nil, grievance: Faker::Verb.base, insane_asylum: Faker::Boolean.boolean, mental_health: Faker::Number.within(range: 1..10))
    end


    greeting
