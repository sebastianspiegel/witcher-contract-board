class Location < ApplicationRecord
    has_many :contracts 
    has_many :monsters, through: :contracts
    validates :name, uniqueness: true, presence: true


    scope :richest_location, -> { find(Contract.richest_location.ids.first) }

    def most_prevelent_type
        #in THIS LOCATION which TYPE of monster is seen the most?

        # Location.monsters / each monsters type_id / count each type_id / order by ASC LIMIT 1
        # SELECT * FROM monsters INNER JOIN contracts ON contracts.monster_id = monsters.id ORDER BY monsters.type_id
        
    end

    def self.with_most_monsters
        #which location has the most mosnters? 
        #SELECT location_id, COUNT (*) FROM contracts JOIN locations WHERE contracts.location_id = locations.id GROUP BY location_id ORDER BY COUNT(*) DESC LIMIT 1
        Location.find(Contract.location_with_most_monsters.first)
    end

    def regional_types

        self.monsters.where 
    end
    
end
