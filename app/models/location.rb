class Location < ApplicationRecord
    has_many :contracts 
    has_many :monsters, through: :contracts 

    def most_prevelent_type
        #most prevelent type of monster in location
        # Location.monsters / each monsters type_id / count each type_id / order by ASC LIMIT 1
    end

    def richest_location
        #location with highest total rewards
    end
end
