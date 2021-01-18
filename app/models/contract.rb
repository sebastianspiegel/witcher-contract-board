class Contract < ActiveRecord::Base
    belongs_to :user
    belongs_to :monster
    belongs_to :location 

    def claim_contract(user)
        self.claimed_id = user.id
        self.save 
    end

end