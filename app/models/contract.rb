class Contract < ActiveRecord::Base
    belongs_to :user
    belongs_to :monster
    belongs_to :location 
    has_many :witcherscontracts 
    accepts_nested_attributes_for :monster, :location 


    def contract_is_claimed?
        WitchersContract.find_by(contract_id: self.id) ? true : false 
    end
    

end