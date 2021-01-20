class User < ActiveRecord::Base
    has_secure_password
    has_many :contracts 
    has_many :monsters, through: :contracts 
    belongs_to :school 
    has_many :witcherscontracts 
    validates :name, uniqueness: true, presence: true

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
            u.name = response[:info][:name]
            u.school_id = 1
            u.password = SecureRandom.hex(15)
        end
    end

    def witcher?
        self.school_id != 1
    end

    def all_of_a_witchers_contracts
        # WitchersContract.where(user_id: user.id)
        wc = WitchersContract.where(user_id: self.id).map {|n| n.contract_id}
        wc.map {|c| Contract.find(c)}
    end

    def self.all_witchers
        where("school_id NOT IN (1)")
    end

    # scope :witcher_contracts, -> { Contract.where(claimed_id: self.id) }

end 