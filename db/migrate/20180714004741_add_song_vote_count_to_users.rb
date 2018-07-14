class AddSongVoteCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :song_votes_count, :integer
  end
end
