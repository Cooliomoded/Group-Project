class Villain < ActiveRecord::Base
    has_many :battles
    has_many :heros, through: :battles


    #updates the insane asylum to false
    def escape_insane_asylum
        self.update(insane_asylum: true)
    end

    #deletes the villain
    def died_in_asylum
        puts "After years and years of being in the insane asylum #{self.alter_ego} has died."
        self.destroy
    end

    #returns the list of battles this villain has been in
    def battle_list
        self.battles
    end

    #returns the heros this hvillain fought through battles
    def heros_fought
        self.battles.map do |hero|
            hero.alter_ego
        end
    end



end