require_relative '../config/environment'
require 'pry'

    #greets the user to start the battle simulator
    def greeting
        buffer
        line
        puts "Welcome to the Hero Battle Simulator."
        puts "Press 1 to play as a Hero. Press 2 to play as a Villain."
        line
        buffer
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
        line
        puts "Press 1 to choose a Hero. Press 2 to generate your own Hero. Press 3 to go back."
        line
        choice = gi_integer
            if choice == 1
                choose_hero
            elsif choice == 2
                generate_hero_name
            elsif choice == 3
                greeting
            else line
                puts "Sorry, please enter either 1, 2, or 3."
                hero_setup
                line
            end
            
    end

    #choose to pick a villain or create a villain
    def villain_setup
        buffer 
        line
        puts "Press 1 to choose a Villain. Press 2 to generate your own Villain. Press 3 to go back."
        line
        choice = gi_integer
            if choice == 1
                choose_villain
            elsif choice == 2
                generate_villain_name
            elsif choice == 3
                greeting
            else line
                puts "Sorry, please enter either 1, 2, or 3."
                line
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

    def buffer
        puts "..."
        puts "..."
        puts "..."
    end

    def line
        puts "_______________________________________________________________________________________"
    end

    #returns the alter egos of all the already created heros
    def display_heros
        line
        i = 1
        Hero.all.each do |hero| 
            puts "#{i}. " + hero.alter_ego
            i +=1
        end
        line
    end

    #returns the alter egos of all the already created villains
    def display_villains
        line
        i = 1
        Villain.all.each do |villain| 
            puts "#{i}. " + villain.alter_ego
            i +=1
        end
        line
    end

    #choose a hero from the list of heros or create your own if you do not like the choices
    def choose_hero
        buffer
        display_heros
        buffer
        line
        puts "Choose a Hero by typing the number they are labeled with into your console."
        line
        choice = gi_integer - 1
        if choice <= Hero.all.length
            buffer
            line
            puts "You chose: #{Hero.all[choice].alter_ego}"
            line
            hero = Hero.all[choice]
            generate_hero_nemesis(hero)
        else line
            puts "Your choice does not exist. Press 1 to rechoose, Press 2 to generate a Hero, Press 3 to go back."
            line
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
        buffer
        display_villains
        buffer
        line
        puts "Choose a Villain by typing the number they are labeled with into your console."
        line
        choice = gi_integer - 1
        if choice <= Villain.all.length
            line
            puts "You chose: #{Villain.all[choice].alter_ego}"
            line
            villain = Villain.all[choice]
            generate_villain_nemesis(villain)
        else line
            puts "Your choice does not exist. Press 1 to rechoose, Press 2 to generate a Hero, Press 3 to go back."
            line
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
        buffer
        villain = Villain.new
        line
        puts "What is your villain's given name?"
        line
        choice = gi_string
        villain.name = choice
        line
        puts "#{villain.name} is the name you chose. If this is correct, press 1? Press 2 if not. Press 3 to go back."
        line
        choice = gi_integer
            if choice == 1
                generate_villain_alter_ego(villain)
            elsif choice == 2
                generate_villain_name
            elsif choice == 3
                villain_setup
            else line
                puts "Your input was not recognized. Please begin this step again."
                line
                generate_villain_name
            end
    end

    #if user chose to create a hero, user creates a name for the hero
    def generate_hero_name
        buffer
        hero = Hero.new
        line
        puts "What is your hero's given name?"
        line
        choice = gi_string
        hero.name = choice
        line
        puts "#{hero.name} is the name you chose. If this is correct, press 1? Press 2 if not. Press 3 to go back."
        line
        choice = gi_integer
            if choice == 1
                generate_hero_alter_ego(hero)
            elsif choice == 2
                generate_hero_name
            elsif choice == 3
                hero_setup
            else line 
                puts "Your input was not recognized. Please begin this step again."
                line
                generate_hero_name
            end
    end

    #if user generated a villain name, user creates an alter ego for the villain
    def generate_villain_alter_ego(villain)
        buffer
        line
        puts "What is your villains's alter ego?"
        line
        choice = gi_string
        villain.alter_ego = choice
        line
        puts "#{villain.alter_ego} is the alter ego you chose. If this is correct, press 1. Press 2 if not. Press 3 to go back."
        line
        choice = gi_integer
            if choice == 1
                generate_villain_super_power(villain)
            elsif choice == 2
                generate_villain_alter_ego(villain)
            elsif choice == 3
                generate_villain_name
            else line
                puts "Your input was not recognized. Please begin this step again."
                line
                generate_villain_alter_ego(villain)
            end
    end

    #if user generated a hero name, user creates an alter ego for the hero
    def generate_hero_alter_ego(hero)
        buffer
        line
        puts "What is your hero's alter ego?"
        line
        choice = gi_string
        hero.alter_ego = choice
        line
        puts "#{hero.alter_ego} is the alter ego you chose. If this is correct, press 1. Press 2 if not. Press 3 to go back."
        line
        choice = gi_integer
            if choice == 1
                generate_hero_super_power(hero)
            elsif choice == 2
                generate_hero_alter_ego(hero)
            elsif choice == 3
                generate_hero_name
            else line
                puts "Your input was not recognized. Please begin this step again."
                line
                generate_hero_alter_ego(hero)
            end
    end

    #if user generated a villain alter ego, user creates a super power for the villain
    def generate_villain_super_power(villain)
        buffer
        line
        puts "What is your villain's super power?"
        line
        choice = gi_string
        villain.super_power = choice
        line
        puts "#{villain.super_power} is the power you chose. If this is correct, press 1. Press 2 if not. Press 3 to go back."
        line
        choice = gi_integer
            if choice == 1
                generate_villain_power_level(villain)
            elsif choice == 2
                generate_villain_super_power(villain)
            elsif choice ==3
                generate_villain_alter_ego(villain)
            else line
                puts "Your input was not recognized. Please begin this step again."
                line
                generate_villain_super_power(villain)
            end
    end

    #if user generated a hero alter ego, user creates a super power for the hero
    def generate_hero_super_power(hero)
        buffer
        line
        puts "What is your hero's super power?"
        line
        choice = gi_string
        hero.super_power = choice
        line
        puts "#{hero.super_power} is the power you chose. If this is correct, press 1. Press 2 if not. Press 3 to go back."
        line
        choice = gi_integer
            if choice == 1
                generate_hero_power_level(hero)
            elsif choice == 2
                generate_hero_super_power(hero)
            elsif choice ==3
                generate_hero_alter_ego(hero)
            else line
                puts "Your input was not recognized. Please begin this step again."
                line
                generate_hero_super_power(hero)
            end
    end

    #if user generated a villain super power, user creates a power level for the villain
    def generate_villain_power_level(villain)
        buffer
        line
        puts "Your villain's power is being calculated..."
        line
        3.times do
            puts "..."
        end
        power = rand(50..300)
        villain.power_lvl = power
        line
        puts "Your villain's power level is #{villain.power_lvl}"
        puts "Is this enough power? Press 1 if it is enough, press 2 to re-roll power level."
        line
        choice = gi_integer
            if choice == 1
                generate_villain_resistance(villain)
            elsif choice == 2
                generate_villain_power_level(villain)
            else line
                puts "Your input was not recognized. Please begin this step again."
                line
                generate_villain_power_level(villain)
            end
    end

    #if user generated a hero super power, user creates a power level for the hero
    def generate_hero_power_level(hero)
        buffer
        line
        puts "Your hero's power is being calculated..."
        3.times do
            puts "..."
        end
        power = rand(50..300)
        hero.power_lvl = power
        puts "Your hero's power level is #{hero.power_lvl}"
        puts "Is this enough power? Press 1 if it is enough, press 2 to re-roll power level."
        line
        choice = gi_integer
            if choice == 1
                generate_hero_resistance(hero)
            elsif choice == 2
                generate_hero_power_level(hero)
            else line
                puts "Your input was not recognized. Please begin this step again."
                line
                generate_hero_power_level(hero)
            end
    end

    #if user generated power level, user creates a resistence amount for the villain
    def generate_villain_resistance(villain)
        buffer
        line
        puts "Your villains's resistance is being calculated..."
        3.times do
            puts "..."
        end
        resistance = rand(1..40)
        villain.resistance = resistance
        puts "Your villain's resistance is #{villain.resistance}"
        puts "Is that enough resistance? Press 1 if it is enough, press 2 to re-roll power level."
        line
        choice = gi_integer
            if choice == 1
                generate_villain_hp(villain)
            elsif choice == 2
                generate_villain_resistance(villain)
            else line
                puts "Your input was not recognized. Please begin this step again."
                line
                generate_villain_resistance(villain)
            end
    end

    #if user generated a hero power level, user creates a hero resistance for the hero
    def generate_hero_resistance(hero)
        buffer
        line
        puts "Your hero's resistance is being calculated..."
        3.times do
            puts "..."
        end
        resistance = rand(1..40)
        hero.resistance = resistance
        puts "Your hero's resistance is #{hero.resistance}"
        puts "Is that enough resistance? Press 1 if it is enough, press 2 to re-roll power level."
        line
        choice = gi_integer
            if choice == 1
                generate_hero_hp(hero)
            elsif choice == 2
                generate_hero_resistance(hero)
            else line
                puts "Your input was not recognized. Please begin this step again."
                line
                generate_hero_resistance(hero)
            end
    end

    #if user generated villain resistance, user creates a villain hp
    def generate_villain_hp(villain)
        buffer
        line
        puts "Your villain's hp is being calculated..."
        buffer
        hp = rand(500..1000)
        villain.hp = hp
        puts "Your villain's health point are #{villain.hp}"
        puts "Is this enough health? Press 1 if it is enough, press 2 to re-roll power level."
        line
        choice = gi_integer
            if choice == 1
                generate_villain_gender(villain)
            elsif choice == 2
                generate_villain_hp(villain)
            else line
                puts "Your input was not recognized. Please begin this step again."
                line
                generate_villain_hp(villain)
            end
    end

    #if user generated a hero resistance, user creates a hero hp for the hero
    def generate_hero_hp(hero)
        buffer
        line
        puts "Your hero's hp is being calculated..."
        buffer
        hp = rand(500..1000)
        hero.hp = hp
        puts "Your hero's health point are #{hero.hp}"
        puts "Is this enough health? Press 1 if it is enough, press 2 to re-roll power level."
        line
        choice = gi_integer
            if choice == 1
                generate_hero_gender(hero)
            elsif choice == 2
                generate_hero_hp(hero)
            else line
                puts "Your input was not recognized. Please begin this step again."
                line
                generate_hero_hp(hero)
            end
    end

     #if user generated a villain hp, user creates a gender for the villain
     def generate_villain_gender(villain)
        buffer
        line
        puts "Is your villain male, female, or any other?"
        line
        choice = gi_string
        villain.gender = choice
        line
        puts "Your villain's gender is #{villain.gender}. If this is correct, press 1. Press 2 if not. Press 3 to go back."
        line
        choice = gi_integer
            if choice == 1
                generate_villain_race(villain)
            elsif choice == 2
                generate_villain_gender(villain)
            elsif choice == 3
                generate_villain_hp(villain)
            else line
                puts "Your input was not recognized. Please begin this step again."
                line
                generate_villain_gender(villain)
            end
    end

    #if user generated a hero hp, user creates a gender for the hero
    def generate_hero_gender(hero)
        buffer
        line
        puts "Is your hero male, female, or any other?"
        line
        choice = gi_string
        hero.gender = choice
        line
        puts "Your hero's gender is #{hero.gender}. If this is correct, press 1. Press 2 if not. Press 3 to go back."
        line
        choice = gi_integer
            if choice == 1
                generate_hero_race(hero)
            elsif choice == 2
                generate_hero_gender(hero)
            elsif choice == 3
                generate_hero_hp(hero)
            else line
                puts "Your input was not recognized. Please begin this step again."
                line
                generate_hero_gender(hero)
            end
    end

     #if user generated a villain gender, user creates a race for the villain
     def generate_villain_race(villain)
        buffer
        line
        puts "What race is your villain?"
        line
        choice = gi_string
        villain.race = choice
        buffer
        line
        puts "Your villain's race is #{villain.race}. If this is correct, press 1. Press 2 if not. Press 3 to go back."
        line
        choice = gi_integer
            if choice == 1
                generate_villain_origin_story(villain)
            elsif choice == 2
                generate_villain_race(villain)
            elsif choice == 3
                generate_villain_gender(villain)
            else line 
                puts "Your input was not recognized. Please begin this step again."
                line
                generate_villain_race(villain)
            end
    end

    #if user generated a hero gender, user creates a race for the hero
    def generate_hero_race(hero)
        buffer
        line
        puts "What race is your hero?"
        line
        choice = gi_string
        hero.race = choice
        buffer
        line
        puts "Your hero's race is #{hero.race}. If this is correct, press 1. Press 2 if not. Press 3 to go back."
        line
        choice = gi_integer
            if choice == 1
                generate_hero_origin_story(hero)
            elsif choice == 2
                generate_hero_race(hero)
            elsif choice == 3
                generate_hero_gender(hero)
            else line
                puts "Your input was not recognized. Please begin this step again."
                line
                generate_hero_race(hero)
            end
    end

    #if user generated a villain race, user creates an origin story for the villain
    def generate_villain_origin_story(villain)
        buffer
        line
        puts "What is your villain's origin story?"
        line
        choice = gi_string
        villain.origin_story = choice
        buffer
        line
        puts "Your villain's origins are:"
        line
        puts "#{villain.origin_story}."
        line
        puts "If this is correct, press 1. Press 2 if not. Press 3 to go back."
        line
        choice = gi_integer
            if choice == 1
                generate_villain_nemesis(villain)
            elsif choice == 2
                generate_villain_origin_story(villain)
            elsif choice == 3
                generate_villain_race(villain)
            else line 
                puts "Your input was not recognized. Please begin this step again."
                line
            end
    end

    #if user generated a hero race, user creates an origin story for the hero
    def generate_hero_origin_story(hero)
        buffer
        line
        puts "What is your hero's origin story?"
        line
        choice = gi_string
        hero.origin_story = choice
        buffer
        line
        puts "Your hero's origins are:"
        line
        puts "#{hero.origin_story}."
        line
        puts "If this is correct, press 1. Press 2 if not. Press 3 to go back."
        line
        choice = gi_integer
            if choice == 1
                generate_hero_nemesis(hero)
            elsif choice == 2
                generate_hero_origin_story(hero)
            elsif choice == 3
                generate_hero_race(hero)
            else line
                puts "Your input was not recognized. Please begin this step again."
                line
            end
    end

      #if user generated a villain origin story, user creates a nemesis for the villain
      def generate_villain_nemesis(villain)
        buffer
        line
        puts "Who is your villain's nemesis?"
        line
        choice = gi_string
        villain.nemesis = choice
        buffer
        line
        puts "Your villain's nemesis is #{villain.nemesis}. If this is correct, press 1. Press 2 if not. Press 3 to go back. Avoid this if you do not want to rewrite your origin story."
        line
        choice = gi_integer
            if choice == 1
                Hero.create(name: Faker::Name.name_with_middle, alter_ego: villain.nemesis, super_power: Faker::Superhero.power, power_lvl: Faker::Number.within(range: 50..300), resistance: Faker::Number.within(range: 1..40), hp: Faker::Number.within(range: 500..1000), gender: Faker::Gender.binary_type, race: Faker::Games::DnD.species, origin_story: Faker::Lorem.paragraphs(number: 3), nemesis: nil)
                generate_villain_grievance(villain)
            elsif choice == 2
                generate_villain_nemesis(villain)
            elsif choice == 3
                generate_villain_origin_story(villain)
            else line
                puts "Your input was not recognized. Please begin this step again."
                line
                generate_villain_nemesis(villain)
            end   
    end

    #if user generated a nemesis, user creates a grievance for the villain
    def generate_villain_grievance(villain)
        buffer
        line
        puts "What is your villain's grievance?"
        line
        choice = gi_string
        villain.grievance = choice
        villain.mental_health = Faker::Number.within(range: 1..10)
        buffer
        line
        puts "Your villain's grievance is #{villain.grievance}. If this is correct, press 1. Press 2 if not. Press 3 to go back."
        line
        choice = gi_integer
            if choice == 1
                villain.save
                generate_your_villain_battle(villain)
            elsif choice == 2
                generate_villain_grievance(villain)
            elsif choice == 3
                generate_villain_nemesis(villain)
            else line
                puts "Your input was not recognized. Please begin this step again."
                line
                generate_villain_grievance(villain)
            end   
    end

    #if user generated a hero origin story, user creates a nemesis for the hero
    def generate_hero_nemesis(hero)
        buffer
        line
        puts "Who is your hero's nemesis?"
        line
        choice = gi_string
        hero.nemesis = choice
        buffer
        line
        puts "Your hero's nemesis is #{hero.nemesis}. If this is correct, press 1. Press 2 if not. Press 3 to go back. Avoid this if you do not want to rewrite your origin story."
        line
        choice = gi_integer
            if choice == 1
                hero.save
                Villain.create(name: Faker::Name.name_with_middle, alter_ego: hero.nemesis, super_power: Faker::Superhero.power, power_lvl: Faker::Number.within(range: 50..300), resistance: Faker::Number.within(range: 1..40), hp: Faker::Number.within(range: 500..1000), gender: Faker::Gender.binary_type, race: Faker::Games::DnD.species, origin_story: Faker::Lorem.paragraphs(number: 3), nemesis: nil, grievance: Faker::Verb.base, insane_asylum: false, mental_health: Faker::Number.within(range: 1..10))
                generate_your_hero_battle(hero)
            elsif choice == 2
                generate_hero_nemesis(hero)
            elsif choice == 3
                generate_hero_origin_story(hero)
            else line
                puts "Your input was not recognized. Please begin this step again."
                line
                generate_hero_nemesis(hero)
            end   
    end

    #the hero has been picked or created, the hero picks a villain or creates a completely random villain
    def generate_your_hero_battle(hero)
        buffer
        line
        puts "Get ready #{hero.alter_ego}, the people need you!"
        puts "What evil wretch are you going to throw behind bars today?"
        display_villains
        puts "Would you like to fight any of these Villains?"
        line
        puts "Press 1 to fight a Villain from the list. Press 2 to generate a random Villain."
        line
        choice = gi_integer
            if choice == 1
                choose_villain_from_list(hero)
            elsif choice == 2
                villain = Villain.create(name: Faker::Name.name_with_middle, alter_ego: Faker::Superhero.name, super_power: Faker::Superhero.power, power_lvl: Faker::Number.within(range: 50..300), resistance: Faker::Number.within(range: 1..40), hp: Faker::Number.within(range: 500..1000), gender: Faker::Gender.binary_type, race: Faker::Games::DnD.species, origin_story: Faker::Lorem.paragraphs(number: 3), nemesis: nil, grievance: Faker::Verb.base, insane_asylum: false, mental_health: Faker::Number.within(range: 1..10))
                hero_battle_sequence(hero, villain)
            else line
                puts "Your input was not recognized, and the world needs you! Please begin this step again."
                line
                generate_your_hero_battle(hero)
            end
    end
                
    #the villain has been picked or created, the villain picks a hero or creates a completely random hero
    def generate_your_villain_battle(villain)
        buffer
        line
        puts "Civilization has been too good for too long. Time to cause some mayhem"
        puts "#{villain.alter_ego} it is your job to cause as much destruction as possible. Which goody two-shoes hero will you humiliate today?"
        display_heros
        puts "You can bully any of these into submission or create another caped-crusader"
        line
        puts "Press 1 to choose a Hero from the list. Press to 2 to generate a random Hero."
        line
        choice = gi_integer
            if choice == 1
                choose_hero_from_list(villain)
            elsif choice == 2
                hero = Hero.create(name: Faker::Name.name_with_middle, alter_ego: Faker::Superhero.name, super_power: Faker::Superhero.power, power_lvl: Faker::Number.within(range: 50..300), resistance: Faker::Number.within(range: 1..40), hp: Faker::Number.within(range: 500..1000), gender: Faker::Gender.binary_type, race: Faker::Games::DnD.species, origin_story: Faker::Lorem.paragraphs(number: 3), nemesis: nil)
                villain_battle_sequence(hero, villain)
            else line
                puts "Your input was not recognized. Please begin this step again."
                line
                generate_your_villain_battle(villain)
            end     
    end

    def choose_villain_from_list(hero)
        display_villains
        puts "Choose a Villain by typing the number they are labeled with into your console."
        line
        choice = gi_integer - 1
        if choice <= Villain.all.length
            buffer
            line
            puts "You chose: #{Villain.all[choice].alter_ego}. If this is correct, press 1. Press 2 to rechoose."
            line
            choice2 = gi_integer
                if choice2 == 1
                    villain = Villain.all[choice]
                    hero_battle_sequence(hero, villain)
                elsif choice2 == 2
                    choose_villian_from_list(hero)
                else choose_villain_from_list(hero)
                end
        else line
            puts "Your choice does not exist. Please begin this step again."
            line
            choose_villain_from_list(hero)
        end

    end

    def choose_hero_from_list(villain)
        display_heros
        puts "Choose a Hero by typing the number they are labeled with into your console."
        line
        choice = gi_integer - 1
        if choice <= Hero.all.length
            buffer
            line
            puts "You chose: #{Hero.all[choice].alter_ego}. If this is correct, press 1. Press 2 to rechoose."
            line
            choice2 = gi_integer
                if choice2 == 1
                    hero = Hero.all[choice]
                    villain_battle_sequence(hero, villain)
                elsif choice2 == 2
                    choose_hero_from_list(villain)
                else choose_hero_from_list(villain)
                end
        else line
            puts "Your choice does not exist. Please begin step again"
            line
            choose_hero_from_list(villain)
        end
    end


    #creates a battle sequence for the hero and villain chosen
    def hero_battle_sequence(hero, villain)
        Battle.start_a_battle(hero, villain)
        battle = Battle.all.last
        hero_hp = hero.hp
        villain_hp = villain.hp
        while villain.hp > 0 && hero.hp > 0 do
            attack(hero, villain)
            line
            puts "The hero's health is #{hero.hp}"
            puts "The villain's health is #{villain.hp}"
        end
        #if villain and hero looses battle, hero dies and villain gets sent to insane asylum
        if villain.hp <= 0 && hero.hp <= 0
            battle.villain_lost(villain)
            line
            puts "'Today, we lost a great hero. #{hero.name}, or as many of you knew them as #{hero.alter_ego}, was one of the best of us. It is a sad day for #{battle.location}'"
            line
            battle.hero_lost(hero)
            battle.update(hero_win: false)
            villain.update(hp: villain_hp)
            line
            puts "'Darn foiled again, but you'll never end me!' said #{villain.name} as they were lead to the asylum."
            puts "GAME OVER"
            line
        elsif villain.hp <=0    
            battle.villain_lost(villain)
            battle.update(hero_win: true)
            hero.update(hp: hero_hp)
            villain.update(hp: villain_hp)
            line
            puts "#{hero.alter_ego} has won the battle"
            puts "'Darn foiled again, but you'll never end me!' said #{villain.name} as they were lead to the asylum."
            line
            battle.destruction
            hero_main_menu(hero)
        #destroys the hero, the hero lost and died 
        elsif hero.hp <= 0
            puts "#{villain.alter_ego} has won the battle"
            puts "'Today, we lost a great hero. #{hero.name}, or as many of you knew them as #{hero.alter_ego}, was one of the best of us. It is a sad day for #{battle.location}'"
            puts "GAME OVER"
            line
            battle.hero_lost(hero)
            battle.update(hero_win: false)
            villain.update(hp: villain_hp)
        end
    end

     #creates a battle sequence for the villain and hero chosen
     def villain_battle_sequence(hero, villain)
        Battle.start_a_battle(hero, villain)
        battle = Battle.all.last
        hero_hp = hero.hp
        villain_hp = villain.hp
        while villain.hp > 0 && hero.hp > 0 do
            attack(hero, villain)
            line
            puts "The hero's health is #{hero.hp}"
            puts "The villain's health is #{villain.hp}"
        end
        #if villain and hero looses battle, hero dies and villain gets sent to insane asylum
        if villain.hp <= 0 && hero.hp <= 0
            battle.villain_lost(villain)
            line
            puts "'Today, we lost a great hero. #{hero.name}, or as many of you knew them as #{hero.alter_ego}, was one of the best of us. It is a sad day for #{battle.location}'"
            battle.hero_lost(hero)
            battle.update(hero_win: false)
            villain.update(hp: villain_hp)
            line
            puts "'Darn foiled again, but you'll never end me!' said #{villain.name} as they were lead to the asylum."
            puts "GAME OVER"
            line
        elsif villain.hp <=0    
            battle.villain_lost(villain)
            battle.update(hero_win: true)
            hero.update(hp: hero_hp)
            villain.update(hp: villain_hp)
            line
            puts "#{hero.alter_ego} has won the battle"
            puts "'Darn foiled again, but you'll never end me!' said #{villain.name} as they were lead to the asylum."
            puts "GAME OVER"
            line
        #destroys the hero, the hero lost and died, sends villain to the main menu
        elsif hero.hp <= 0
            line
            puts "#{villain.alter_ego} has won the battle"
            puts "'Today, we lost a great hero. #{hero.name}, or as many of you knew them as #{hero.alter_ego}, was one of the best of us. It is a sad day for #{battle.location}'"
            line
            battle.hero_lost(hero)
            battle.update(hero_win: false)
            villain.update(hp: villain_hp)
            battle.destruction
            villain_main_menu(villain)
        end
    end

    #hero and villain hit each other until one loses hp
    def attack(hero, villain)
        hero.update(hp: (hero.hp - (villain.power_lvl - hero.resistance)))
        villain.update(hp: (villain.hp - (hero.power_lvl - villain.resistance)))
        sleep(1)
    end

    def hero_main_menu(hero)
        buffer
        line
        puts "You survived #{hero.alter_ego}! What would you like to do? Type the number next to the option to navigate in to that menu."
        line
        hero_menu_display(hero)   
    end

    def villain_main_menu(villain)
        buffer
        line
        puts "Your evil plans went off without a hitch #{villain.alter_ego}! What plot would you like to concoct next? Type the number next to the option to navigate in to that menu."
        line
        villain_menu_display(villain)
    end

    def hero_menu_display(hero)
        line
        puts "1. Fight Another Villain"
        puts "2. Check Battle Record"
        puts "3. Rename Hero"
        puts "4. Hero Stats"
        puts "5. Quit"
        line
        choice = gi_integer
        if choice == 1
            line
            puts "You would like to fight another villain? Press 1 to fight, press 2 to go back."
            line
            choice = gi_integer
            if choice == 1
                generate_your_hero_battle(hero)
            elsif choice == 2
                hero_menu_display(hero)
            end
        elsif choice == 2
            line
            puts "You would like to check your battle record? Press 1 to check your record, press 2 to go back."
            line
            choice = gi_integer
                if choice == 1
                    buffer
                    line
                    Battle.all.each do |battle|
                        battle.attributes.each do |key, value|
                            puts "#{key} is #{value}"
                            end
                        end
                    line
                    puts "Press 2 to go back"
                    line
                    buffer
                    choice = gi_integer
                    if choice == 2
                        hero_menu_display(hero)
                    else line 
                        puts "You pressed the wrong 2, go back to the main menu."
                        line
                        hero_menu_display(hero)
                    end
                elsif choice == 2
                    line
                    hero_menu_display(hero)
                else line
                    puts "Your input was not recognized. Please go back."
                    line
                    hero_menu_display(hero)
                end
        elsif choice == 3
            line
            puts "You would like to rename your hero? Press 1 to confirm, press 2 to go back."
            line
            choice = gi_integer
            if choice == 1
                line
                puts "What would you like to change your name to?"
                line
                choice = gi_string
                hero.update(alter_ego: choice)
                puts "Your new name is #{choice}."
                line
                hero_menu_display(hero)
            else line
                hero_menu_display(hero)
            end
        elsif choice == 4
            line
            puts "Your hero's stats are:"
                hero.attributes.each do |key, value|
                    line
                    puts "#{key} is #{value}"
                end
            line
            puts "To go back press 2."
            choice = gi_integer
            if choice == 2
                line
                hero_menu_display(hero)
            else line
                hero_menu_display(hero)
            end
        elsif choice == 5
            puts "Are you sure you want to quit? Will the people be safe? Type 1 to quit, 2 to go back."
            choice = gi_integer
            if choice == 1
                line
                puts "Good Game!"
                line
            else line
                hero_menu_display(hero)
            end
        else line
            puts "Your choice was not recognized. Rechoose."
            hero_menu_display(hero)
        end
    end

    def villain_menu_display(villain)
        line
        puts "1. Fight Another Hero"
        puts "2. Check Battle Record"
        puts "3. Rename Villain"
        puts "4. Villain Stats"
        puts "5. Quit"
        line
        choice = gi_integer
        if choice == 1
            line
            puts "You would like to fight another hero? Press 1 to fight, press 2 to go back."
            line
            choice = gi_integer
            if choice == 1
                generate_your_villain_battle(villain)
            elsif choice == 2
                villain_menu_display(villain)
            end
        elsif choice == 2
            line
            puts "You would like to check the battle record? Press 1 to check your record, press 2 to go back."
            line
            choice = gi_integer
                if choice == 1
                    buffer
                    line
                    Battle.all.each do |battle|
                        battle.attributes.each do |key, value|
                            puts "#{key} is #{value}"
                            end
                        end
                    line
                    puts "Press 2 to go back"
                    line
                    choice = gi_integer
                    if choice == 2
                        villain_menu_display(villain)
                    else line 
                        puts "You pressed the wrong 2, go back to the main menu."
                        line
                        villain_menu_display(villain)
                    end
                elsif choice == 2
                    line
                    villain_menu_display(villain)
                else line
                    puts "Your input was not recognized. Please go back."
                    line
                    villain_menu_display(villain)
                end
        elsif choice == 3
            line
            puts "You would like to rename your villain? Press 1 to confirm, press 2 to go back."
            line
            choice = gi_integer
            if choice == 1
                line
                puts "What would you like to change your name to?"
                line
                choice = gi_string
                villain.alter_ego = choice
                puts "Your new name is #{choice}."
                line
            else line
                villain_menu_display(villain)
            end
        elsif choice == 4
            line
            puts "Your villains stats are:"
            villain.attributes.each do |key, value|
                line
                puts "#{key} is #{value}"
            end
            line
            puts "To go back press 2."
             choice = gi_integer
             if choice == 2
                line
                villain_menu_display(villain)
            else line
                villain_menu_display(villain)
            end
        elsif choice == 5
            puts "Are you sure you want to quit? Giving up on the villain lifestyle? Type 1 to quit, 2 to go back."
            choice = gi_integer
            if choice == 1
                line
                    puts "Good Game!"
                line
            else line
                villain_menu_display(villain)
            end
        else line
            puts "Your choice was not recognized. Rechoose."
            villain_menu_display(villain)
        end
    end
   

    greeting
