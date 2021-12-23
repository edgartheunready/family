class CreateName < ActiveRecord::Migration[7.0]
  def change
    create_table :names do |t|
      t.string :name
      t.integer :game_id
      t.timestamps
    end

    add_index :names, :game_id

  end
end
