class School < ApplicationRecord
    has_many :users 

    def witcher_schools
        @witcher_schools = ["School of the Cat", "School of the Wolf", "School of the Bear"]
    end
    
end
