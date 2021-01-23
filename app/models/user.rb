class User < ActiveRecord::Base
    has_secure_password
    has_many :contracts 
    has_many :monsters, through: :contracts 
    has_many :claimed_contracts, foreign_key: "witcher_id", class_name: "Contract" 
    belongs_to :school 
    validates :name, uniqueness: true, presence: true
    validates :username, uniqueness: true, presence: true, format: { without: /\s/ }, length: {minimum: 5}

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
            u.name = response[:info][:name]
            u.username = response[:info][:name].gsub(/\s+/, "").downcase
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

    scope :all_witchers, -> { where.not(school_id: [1])}

    def total_rewards
        claimed_contracts.sum(:reward)
    end

end 