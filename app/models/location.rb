class Location < ApplicationRecord
    has_many :contracts 
    has_many :monsters, through: :contracts
    validates :name, uniqueness: true, presence: true

    def most_prevelent_type
        #in THIS LOCATION which TYPE of monster is seen the most?

        # Location.monsters / each monsters type_id / count each type_id / order by ASC LIMIT 1
        # SELECT * FROM monsters INNER JOIN contracts ON contracts.monster_id = monsters.id ORDER BY monsters.type_id
        
    end

    def location_with_most_monsters
        #which location has the most mosnters? 
        # SELECT * FROM contracts INNER JOIN locations WHERE contracts.location_id = locations.id ORDER BY location_id
    end

    def richest_location
        #location with highest total rewards
        #select reward from contract where location == self 

        Contract.where(:location_id => self.id).sum(:reward)
    end

    def regional_types
        self.monsters.map {|monster| monster.type}.map {|type| type.name}
    end
    
end
