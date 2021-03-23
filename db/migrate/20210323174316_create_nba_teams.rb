class CreateNbaTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :nba_teams do |t|
      t.string :abrreviation
      t.string :city
      t.string :conference
      t.string :division
      t.string :full_name
      t.string :name
    end
  end
end
