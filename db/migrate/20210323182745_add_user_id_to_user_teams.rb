class AddUserIdToUserTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :user_teams, :user_id, :integer
  end
end
