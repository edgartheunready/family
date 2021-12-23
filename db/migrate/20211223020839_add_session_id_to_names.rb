class AddSessionIdToNames < ActiveRecord::Migration[7.0]
  def change
    add_column :names, :session_id, :string
    add_index :names, :session_id
  end
end
