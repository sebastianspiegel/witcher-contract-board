class Monster < ActiveRecord::Base
    has_many :contracts 
    has_many :users, through: :contracts 
    belongs_to :type 
    has_and_belongs_to_many :weaknesses
    validates :name, uniqueness: true, presence: true 
    validates :type, presence: true 

    def find_weaknesses
        c = self.weaknesses.count
        if c == 1
            self.weaknesses.first.name 
        elsif c == 2
            self.weaknesses.first.name + ", " + self.weaknesses.last.name
        end
    end

end
