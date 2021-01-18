class User < ActiveRecord::Base
    has_secure_password
    has_many :contracts 
    has_many :monsters, through: :contracts 
    belongs_to :school 

    def witcher?
        #is user a witcher?
        self.school_id != 1
    end

end