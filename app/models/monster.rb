class Monster < ActiveRecord::Base
    has_many :contracts 
    has_many :users, through: :contracts 
    belongs_to :type 
    has_and_belongs_to_many :weaknesses
    validates :name, uniqueness: true, presence: true
    validates :type, presence: true 

end