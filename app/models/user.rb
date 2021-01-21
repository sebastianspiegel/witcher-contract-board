class User < ActiveRecord::Base
    has_secure_password
    has_many :contracts 
    has_many :monsters, through: :contracts 
    has_many :claimed_contracts, foreign_key: "witcher_id", class_name: "Contract" 
    belongs_to :school 
    validates :name, uniqueness: true, presence: true

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
            u.name = response[:info][:name]
            u.school_id = 1
            u.password = SecureRandom.hex(15)
        end
    end

    def witcher?
        school_id != 1
    end

    # def all_of_a_witchers_contracts
    #     self.claimed_contracts 
    #     i know this is redundant, just reminding myself it exists 
    # end

    def self.all_witchers
        where("school_id NOT IN (1)")
        #rewrite V
        # scope :all_witchers, 
    end



    def total_rewards
        # add up all the rewards from all the contracts a witcher has claimed 
        # SELECT SUM(contracts.reward) FROM  contracts JOIN users ON contracts.witcher_id = users.id ORDER BY contracts.witcher_id
        claimed_contracts.sum(:reward)

        # User.find(6).total_rewards => [100, 50] 

        # User.find(6).claimed_contracts.sum(:reward) => 150 
    end

end 