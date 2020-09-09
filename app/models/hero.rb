class Hero < ActiveRecord::Base
    has_many :battles
    has_many :villains, through: :battles

    #returns the list of battles this hero has been in
    def battle_list
        self.battles
    end

    #returns the villains this hero fought through battles
    def villains_fought
        self.battles.map do |villain|
            villain.alter_ego
        end
    end

    
   



end