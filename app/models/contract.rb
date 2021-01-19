class Contract < ActiveRecord::Base
    belongs_to :user
    belongs_to :monster
    belongs_to :location 
    accepts_nested_attributes_for :monster
    accepts_nested_attributes_for :location

    def claim_contract(user)
        self.claimed_id = user.id
        self.save 
    end

    def contract_is_claimed?
        !!self.claimed_id 
    end
    

end