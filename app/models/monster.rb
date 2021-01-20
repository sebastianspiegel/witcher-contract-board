class Monster < ActiveRecord::Base
    has_many :contracts 
    has_many :users, through: :contracts 
    belongs_to :type 
    validates :name, uniqueness: true, presence: true

end