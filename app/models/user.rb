class User < ActiveRecord::Base
    has_secure_password
    has_many :contracts 
    has_many :monsters, through: :contracts 
    belongs_to :school 
    has_many :witcherscontracts 

    def witcher?
        self.school_id != 1
    end

    def all_of_a_witchers_contracts
        Contract.where(id: )#matches witcherscontract contract_id
    end

    def self.all_witchers
        where("school_id NOT IN (1)")
    end

    # scope :witcher_contracts, -> { Contract.where(claimed_id: self.id) }

end 