class Battle < ActiveRecord::Base
    belongs_to :hero
    belongs_to :villain

    #destroys the hero, the hero lost and died 
    def self.hero_lost(hero)
        if hero.hp <= 0
            hero.destroy
        end
    end

    #villain loses battle, gets sent to insane asylum
    def self.villain_lost
        if villain.hp <= 0
            self.villain.insane_asylum = true
        end
    end

    #changes the destruction severity of a battle, if there is a a fair amount of damage, a hero is created. If a lot, create villain.
    def destruction 
        self.update(destruction: true)
        self.update(destruction_severity: rand(1.0..10.0))
        if destruction_severity >= 6.0
            Hero.create
        elsif destruction_severity >= 8.0
            Villain.create
        end
    end

    #creates a battle with your hero and a random villain
    def self.start_a_battle(hero, villain)
        Battle.create(hero_id: Hero.find(hero.id), villain_id: Villain.find(villain.id))
    end




end