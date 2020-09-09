require_relative '../config/environment'
    #greets the user to start the battle simulator
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

    #choose to pick a hero or create a hero
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

    #choose to pick a villain or create a villain
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

    #returns the alter egos of all the already created heros
    def display_heros
        i = 1
        Hero.all.each {|hero| puts "#{i}. " + hero.alter_ego}
        i + 1
    end

    #returns the alter egos of all the already created villains
    def display_villains
        i = 1
        Villain.all.each {|villain| puts "#{i}. " + villain.alter_ego}
        i + 1
    end

    #choose a hero from the list of heros or create your own if you do not like the choices
    def choose_hero
        display_heros
        puts "Choose a Hero by typing the number they are labeled with into your console."
        choice = gi_integer - 1
        if choice <= Hero.all.length
            puts "You chose: #{Hero.all[choice]}"
            generate_hero_nemesis
        else puts "Your choice does not exist. Press 1 to rechoose, Press 2 to generate a Hero, Press 3 to go back."
            choice = gi_integer
            if choice == 1
                choose_hero
            elsif choice == 2
                generate_hero_name
            elsif choice == 3
                hero_setup
            end
        end
    end

    #choose a hero from the list of villains or create your own if you do not like the choices
    def choose_villain
        display_villains
        puts "Choose a Villain by typing the number they are labeled with into your console."
        choice = gi_integer - 1
        if choice <= Villain.all.length
            puts "You chose: #{Villain.all[choice]}"
            generate_villain_nemesis
        else puts "Your choice does not exist. Press 1 to rechoose, Press 2 to generate a Hero, Press 3 to go back."
            choice = gi_integer
            if choice == 1
                choose_villain
            elsif choice == 2
                generate_villain_name
            elsif choice == 3
                villain_setup
            end
        end
    end

    #if user chose to create a villain, user creates a name for the villain
    def generate_villain_name
        villain = Villain.new
        puts "What is your villain's given name?"
        choice = gi_string
        villain.name = choice
        puts "#{villain.name} is the name you chose. If this is correct, press 1? Press 2 if not. Press 3 to go back."
        choice = gi_integer
            if choice == 1
                generate_villain_alter_ego(villain)
            elsif choice == 2
                generate_villain_name
            elsif choice == 3
                choose_villain
            else puts "Your input was not recognized. Please begin this step again."
                generate_villain_name
            end
    end

    #if user chose to create a hero, user creates a name for the hero
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

    #if user generated a villain name, user creates an alter ego for the villain
    def generate_villain_alter_ego(villain)
        puts "What is your villains's alter ego?"
        choice = gi_string
        villain.alter_ego = choice
        puts "#{villain.alter_ego} is the alter ego you chose. If this is correct, press 1. Press 2 if not. Press 3 to go back."
        choice = gi_integer
            if choice == 1
                generate_villain_super_power(villain)
            elsif choice == 2
                generate_villain_alter_ego
            elsif choice == 3
                generate_villain_name
            else puts "Your input was not recognized. Please begin this step again."
                generate_villain_alter_ego
            end
    end

    #if user generated a hero name, user creates an alter ego for the hero
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

    #if user generated a villain alter ego, user creates a super power for the villain
    def generate_villain_super_power(villain)
        puts "What is your hero's super power?"
        choice = gi_string
        villain.super_power = choice
        puts "#{villain.super_power} is the power you chose. If this is correct, press 1. Press 2 if not. Press 3 to go back."
        choice = gi_integer
            if choice == 1
                generate_villain_power_level(villain)
            elsif choice == 2
                generate_villain_super_power(villain)
            elsif choice ==3
                generate_villain_alter_ego(villain)
            else puts "Your input was not recognized. Please begin this step again."
                generate_villain_super_power(villain)
            end
    end

    #if user generated a hero alter ego, user creates a super power for the hero
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

    #if user generated a villain super power, user creates a power level for the villain
    def generate_villain_power_level(villain)
        puts "Your villain's power is being calculated..."
        3.times do
            puts "..."
        end
        power = rand(50..300)
        villain.power_lvl = power
        puts "Your villain's power level is #{villain.power_lvl}"
        puts "Is this enough power? Press 1 if it is enough, press 2 to re-roll power level."
        choice = gi_integer
            if choice == 1
                generate_villain_resistance(villain)
            elsif choice == 2
                generate_villain_power_level(villain)
            else puts "Your input was not recognized. Please begin this step again."
                generate_villain_power_level(villain)
            end
    end

    #if user generated a hero super power, user creates a power level for the hero
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

    #if user generated power level, user creates a resistence amount for the villain
    def generate_villain_resistance(villain)
        puts "Your villains's resistance is being calculated..."
        3.times do
            puts "..."
        end
        resistance = rand(1..40)
        villain.resistance = resistance
        puts "Your villain's resistance is #{villain.resistance}"
        puts "Is that enough resistance? Press 1 if it is enough, press 2 to re-roll power level."
        choice = gi_integer
            if choice == 1
                generate_villain_hp(villain)
            elsif choice == 2
                generate_villain_resistance(villain)
            else puts "Your input was not recognized. Please begin this step again."
                generate_villain_resistance(villain)
            end
    end

    #if user generated a hero power level, user creates a hero resistance for the hero
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

    #if user generated villain resistance, user creates a villain hp
    def generate_villain_hp(villain)
        puts "Your villain's hp is being calculated..."
        3.times do
            puts "..."
        end
        hp = rand(500..1000)
        villain.hp = hp
        puts "Your villain's health point are #{villain.hp}"
        puts "Is this enough health? Press 1 if it is enough, press 2 to re-roll power level."
        choice = gi_integer
            if choice == 1
                generate_villain_gender(villain)
            elsif choice == 2
                generate_villain_hp(villain)
            else puts "Your input was not recognized. Please begin this step again."
                generate_villain_hp(villain)
            end
    end

    #if user generated a hero resistance, user creates a hero hp for the hero
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

     #if user generated a villain h, user creates a gender for the villain
     def generate_villain_gender(hero)
        puts "Is your villain male, female, or any other?"
        choice = gi_string
        villain.gender = choice
        puts "Your villain's gender is #{hero.gender}. If this is correct, press 1. Press 2 if not. Press 3 to go back."
        choice = gi_integer
            if choice == 1
                generate_villain_race(villain)
            elsif choice == 2
                generate_villain_gender(villain)
            elsif choice == 3
                generate_villain_hp(villain)
            else puts "Your input was not recognized. Please begin this step again."
                generate_villain_gender(villain)
            end
    end

    #if user generated a hero hp, user creates a gender for the hero
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

     #if user generated a villain gender, user creates a race for the villain
     def generate_villain_race(villain)
        puts "What race is your villain?"
        choice = gi_string
        villain.race = choice
        puts "Your villain's race is #{villain.race}. If this is correct, press 1. Press 2 if not. Press 3 to go back."
        choice = gi_integer
            if choice == 1
                generate_villain_origin_story(villain)
            elsif choice == 2
                generate_villain_race(villain)
            elsif choice == 3
                generate_villain_gender(villain)
            else puts "Your input was not recognized. Please begin this step again."
                generate_villain_race(villain)
            end
    end

    #if user generated a hero gender, user creates a race for the hero
    def generate_hero_race(hero)
        puts "What race is your hero?"
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

    #if user generated a villain race, user creates an origin story for the villain
    def generate_villain_origin_story(villain)
        puts "What is your villain's origin story?"
        choice = gi_string
        villain.origin_story = choice
        puts "Your villain's origins are #{villain.origin_story}. If this is correct, press 1. Press 2 if not. Press 3 to go back."
        choice = gi_integer
            if choice == 1
                generate_villain_nemesis(villain)
            elsif choice == 2
                generate_villain_origin_story(villain)
            elsif choice == 3
                generate_villain_race(villain)
            else puts "Your input was not recognized. Please begin this step again."
            end
    end

    #if user generated a hero race, user creates an origin story for the hero
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

      #if user generated a villain origin story, user creates a nemesis for the villain
      def generate_villain_nemesis(villain)
        puts "Who is your villain's nemesis?"
        choice = gi_string
        villain.nemesis = choice
        puts "Your villain's nemesis is #{villain.nemesis}. If this is correct, press 1. Press 2 if not. Press 3 to go back. Avoid this if you do not want to rewrite your origin story."
        choie = gi_integer
            if choice == 1
                generate_villain_hero_battle(villain)
            elsif choice == 2
                generate_villain_nemesis(villain)
            elsif choice == 3
                generate_villain_origin_story(villain)
            else puts "Your input was not recognized. Please begin this step again."
            end
        villain.save
        new_hero = Hero.create(name: villain.nemesis, alter_ego: Faker::Superhero.name, super_power: Faker::Superhero.power, power_lvl: Faker::Number.within(range: 50..300), resistance: Faker::Number.within(range: 1..40), hp: Faker::Number.within(range: 500..1000), gender: Faker::Gender.binary_type, race: Faker::Games::DnD.species, origin_story: Faker::Lorem.paragraphs(number: 3), nemesis: nil, grievance: Faker::Verb.base, insane_asylum: Faker::Boolean.boolean, mental_health: Faker::Number.within(range: 1..10))   
    end

    #if user generated a hero origin story, user creates a nemesis for the hero
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

    #the hero has been picked or created, the hero picks a villain or creates a completely random villain
    def generate_your_hero_battle(hero)
        puts "Get ready #{hero.alter_ego}, the people need you!"
        puts "What evil wretch are you going to throw behind bars today?"
        display_villains
        puts "Would you like to fight any of these Villains?"
        puts "If not we can find you a random Villain or you can generate one to fight."
        puts "Press 1 to fight a Villain from the list. Press 2 to generate a Villain."
        choice = gi_integer
            if choice == 1
                choose_villain_from_list(hero)
            elsif choice == 2
                villain = Villain.new(name: Faker::Name.name_with_middle, alter_ego: Faker::Superhero.name, super_power: Faker::Superhero.power, power_lvl: Faker::Number.within(range: 50..300), resistance: Faker::Number.within(range: 1..40), hp: Faker::Number.within(range: 500..1000), gender: Faker::Gender.binary_type, race: Faker::Games::DnD.species, origin_story: Faker::Lorem.paragraphs(number: 3), nemesis: nil, grievance: Faker::Verb.base, insane_asylum: Faker::Boolean.boolean, mental_health: Faker::Number.within(range: 1..10))
                #BATTLE GENERATOR/S PLACEHOLDER
            else puts "Your input was not recognized, and the world needs you! Please begin this step again."
            end
            
    end
                
    #the villain has been picked or created, the villain picks a hero or creates a completely random hero
    def generate_your_villain_battle(villain)
        puts "Civilization has been too good for too long. Time to cause some mayhem"
        puts "#{villain.alter_ego} it is your job to cause as much destruction as possible. Which goody two-shoes hero will you humiliate today?"
        display_heros
        puts "You can bully any of these into submission or create another caped-crusader"
        puts "Press 1 to fight a Hero from the list. Press to 2 to generate a Hero."
        choice = gi_integer
            if choice == 1
                choose_hero_from_list(villain)
            elsif choice == 2
                hero = Hero.new(name: Faker::Name.name_with_middle, alter_ego: Faker::Superhero.name, super_power: Faker::Superhero.power, power_lvl: Faker::Number.within(range: 50..300), resistance: Faker::Number.within(range: 1..40), hp: Faker::Number.within(range: 500..1000), gender: Faker::Gender.binary_type, race: Faker::Games::DnD.species, origin_story: Faker::Lorem.paragraphs(number: 3), nemesis: nil)
                #BATTLE GENERATOR/SEQUENCE PLACEHOLDER
            else puts "Your input was not recognized. Please begin this step again."
            end
    end

    def choose_villain_from_list(hero)
        display_villains
        puts "Choose a Villain by typing the number they are labeled with into your console."
        choice = gi_integer - 1
        if choice <= Villain.all.length
            puts "You chose: #{Villain.all[choice]}"
        else puts "Your choice does not exist. Press 1 to rechoose"
            choice = gi_integer
            if choice == 1
                choose_villain_from_list
            end
        end
        villain = Villain.all[choice]
        battle_sequence(hero, villain)
    end

    def choose_hero_from_list(villain)
        display_heros
        puts "Choose a Hero by typing the number they are labeled with into your console."
        choice = gi_integer - 1
        if choice <= Hero.all.length
            puts "You chose: #{Hero.all[choice]}"
        else puts "Your choice does not exist. Press 1 to rechoose"
            choice = gi_integer
            if choice == 1
                choose_hero_from_list
            end
        end
        hero = Hero.all[choice]
        battle_sequence(hero, villain)
    end




    def battle_sequence(hero, villain)

        if villain.hp <= 0
            Battle.villain_lost
        elsif hero.hp <= 0

        else
        battle_sequence
        
    end

end
    greeting
