class Location < ApplicationRecord
    has_many :contracts 
    has_many :monsters, through: :contracts 
end
