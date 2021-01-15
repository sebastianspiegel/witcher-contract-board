class User < ActiveRecord::Base
    has_secure_password
    has_many :contracts 
    has_many :monsters, through :contracts 


end