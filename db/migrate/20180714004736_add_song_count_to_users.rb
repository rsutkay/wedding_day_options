class AddSongCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :songs_count, :integer
  end
end
