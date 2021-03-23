class UserTeam < ActiveRecord::Base
    belongs_to :user
    has_many :user_team_players
    has_many :players, through: :user_team_players

end