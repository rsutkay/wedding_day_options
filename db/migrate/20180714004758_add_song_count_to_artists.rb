class AddSongCountToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :songs_count, :integer
  end
end
