class User < ActiveRecord::Base
    has_secure_password
    has_many :contracts 
    has_many :monsters, through: :contracts 
    belongs_to :school 

    def witcher_schools
        @witcher_schools = ["School of the Cat", "School of the Wolf", "School of the Bear"]
    end


end