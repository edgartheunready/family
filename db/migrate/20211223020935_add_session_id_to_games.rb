class AddSessionIdToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :session_id, :string
  end
end
