class Contract < ActiveRecord::Base
    belongs_to :user
    belongs_to :monster
    belongs_to :location 
    accepts_nested_attributes_for :monster, :location 
    validates :details, presence: true


    def contract_is_claimed?
        # WitchersContract.find_by(contract_id: self.id) ? true : false 
        self.witcher_id? 
    end

    def claimed_by
        if contract_is_claimed?
            #WitchersContract.find_by(contract_id: self.id).user
            User.find(witcher_id)
        end
    end

    def self.unclaimed_contracts
        #scope method for all unclaimed contracts 
        #write as scope method after you figure it out 
    end

end