class Location < ApplicationRecord
    has_many :contracts 
    has_many :monsters, through: :contracts
    validates :name, uniqueness: true, presence: true


    scope :richest_location, -> { find(Contract.richest_location.ids.first) }

    scope :with_most_monsters, -> { find(Contract.location_with_most_monsters.first) }

    def most_prevelent_type
        #in THIS LOCATION which TYPE of monster is seen the most?
        # Location.monsters / each monsters type_id / count each type_id / order by ASC LIMIT 1
        # SELECT * FROM monsters INNER JOIN contracts ON contracts.monster_id = monsters.id ORDER BY monsters.type_id
    end

    def regional_types
        self.contracts.map{|c| c.monster}.map{|m| m.type}.map{|t| t.name}
    end

    def display_regional_types
        if self.regional_types.count == 0
            "No monsters here!"
        else
            self.regional_types.uniq.join(", ").pluralize
        end
    end
    
end
