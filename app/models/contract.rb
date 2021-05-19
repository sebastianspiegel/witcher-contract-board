class Contract < ActiveRecord::Base
    belongs_to :user
    belongs_to :monster
    belongs_to :location 
    #belongs_to witcher aliasing / has_many :claimed_contracts, foreign_key: "witcher_id", class_name: "Contract" 
    belongs_to :witcher, foreign_key: "witcher_id", class_name: "User", optional: true  

    accepts_nested_attributes_for :monster, reject_if: proc { |attributes| attributes['name'].blank? }
    accepts_nested_attributes_for :location, reject_if: proc { |attributes| attributes['name'].blank? }

    validates :details, presence: true, length: { minimum: 10 }

    before_save :find_or_create_monster
    before_save :find_or_create_location


    def contract_is_claimed?
        self.witcher_id? 
    end

    def claimed_by
        if contract_is_claimed?
            self.witcher 
        end
    end

    scope :unclaimed_contracts, -> { where(witcher_id: nil) }

    scope :location_with_most_monsters, -> {select(:location_id).joins(:location).group(:location_id).order("count_location_id DESC").count.first}
    #first number = location_id, second number = # of contracts out

    #richest_location
    # "SELECT SUM(reward), location_id FROM contracts GROUP BY location_id ORDER BY SUM(reward) DESC LIMIT 1" 
    scope :richest_location, -> { select(:location_id, sum(:reward)).group(:location_id).order( "SUM(reward) DESC").limit(1) } 


    private

    def find_or_create_monster
        self.monster = Monster.find_or_create_by(name: self.monster.name)
    end

    def find_or_create_location
        self.location = Location.find_or_create_by(name: self.location.name)
    end

end