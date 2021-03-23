class NbaTeam < ActiveRecord::Base
    has_many :players 
end