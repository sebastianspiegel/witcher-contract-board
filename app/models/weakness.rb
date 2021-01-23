class Weakness < ApplicationRecord
    belongs_to :weakness_type 
    has_and_belongs_to_many :monsters 

    validates :name, presence: true
    validates :weakness_type_id, presence: true 

end

