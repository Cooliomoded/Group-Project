class Battle < ActiveRecord::Base
    belongs_to :hero
    belongs_to :villain

    #destroys the hero, the hero lost and died 
    def hero_lost
        if hero.hp <= 0
            self.hero.destroy
        end
    end

    #villain loses battle, gets sent to insane asylum
    def villain_lost
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
    def start_a_battle(hero, villain = Villain.all[rand(Villain.all.length)])
        Battle.create(hero_id: hero.id, villain_id: villain.id)
    end




end