class SongLeaderboardController < ApplicationController
  def index
    # @votes = Vote.all
    @songs = Song.all
    @song_vote = SongVote.new
    # @leaderboard = {}
    # @drinks.each do |drink|
    #   @leaderboard[drink] = drink.votes.count
    # end
    # @leaderboard.sort_by {|_key, value| value}.to_h.keys.reverse
    # h.sort_by {|_key, value| value}.to_h.keys.reverse

    @leaderboard = @songs.sort_by do |song|
      song.song_votes.count
    end.reverse

    render("song_leaderboard/index.html.erb")
  end
end