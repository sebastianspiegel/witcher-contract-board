class Contract < ActiveRecord::Base
    belongs_to :user
    belongs_to :monster
    belongs_to :location 
    #belongs_to witcher aliasing 
    accepts_nested_attributes_for :monster, reject_if: proc { |attributes| attributes['name'].blank? } #find or creat by
    accepts_nested_attributes_for :location, reject_if: proc { |attributes| attributes['name'].blank? }
    validates :details, presence: true, length: { minimum: 10 }


    def contract_is_claimed?
        self.witcher_id? 
    end

    def claimed_by
        if contract_is_claimed?
            User.find(witcher_id)
        end
    end

    scope :unclaimed_contracts, -> { where(witcher_id: nil) }

    scope :location_with_most_monsters, -> {select(:location_id).joins(:location).group(:location_id).order("count_location_id DESC").count.first}
    #first number = location_id, second number = # of contracts out

    #richest_location
    # "SELECT SUM(reward), location_id FROM contracts GROUP BY location_id ORDER BY SUM(reward) DESC LIMIT 1" 
    scope :richest_location, -> { select(:location_id, sum(:reward)).group(:location_id).order( "SUM(reward) DESC").limit(1) } 

end