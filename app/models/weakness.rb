class Weakness < ApplicationRecord
    belongs_to :weakness_type 
    has_and_belongs_to_many :monsters 
end
