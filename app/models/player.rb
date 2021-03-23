class Player < ActiveRecord::Base
    has_many :user_team_players
    has_many :user_teams, through: :user_team_players
    belongs_to :Nba_team
end