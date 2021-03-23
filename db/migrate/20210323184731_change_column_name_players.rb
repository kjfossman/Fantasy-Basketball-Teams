class ChangeColumnNamePlayers < ActiveRecord::Migration[6.1]
  def change
    rename_column :players, :Nba_team_id, :nba_team_id
  end
end
