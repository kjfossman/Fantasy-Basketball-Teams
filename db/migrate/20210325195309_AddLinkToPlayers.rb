class AddLinkToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :stats_link, :string
  end
end
