class User < ActiveRecord::Base
    has_secure_password
    has_many :contracts 
    has_many :monsters, through: :contracts 
    belongs_to :school 

    def witcher?
        self.school_id != 1
    end

    def witcher_contracts
        Contract.where(claimed_id: self.id) 
    end

    # scope :witcher_contracts, -> { Contract.where(claimed_id: self.id) }

end 