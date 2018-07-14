class AddSongVoteCountToSongs < ActiveRecord::Migration[5.0]
  def change
    add_column :songs, :song_votes_count, :integer
  end
end
