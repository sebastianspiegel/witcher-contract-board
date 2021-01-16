class Monster < ActiveRecord::Base
    has_many :contracts 
    has_many :users, through: :contracts 
    belongs_to :type 

end