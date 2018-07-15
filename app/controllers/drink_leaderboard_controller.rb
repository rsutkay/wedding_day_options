class DrinkLeaderboardController < ApplicationController
  def index
    # @votes = Vote.all
    @drinks = Drink.all
    @drink_vote = DrinkVote.new
    # @leaderboard = {}
    # @drinks.each do |drink|
    #   @leaderboard[drink] = drink.votes.count
    # end
    # @leaderboard.sort_by {|_key, value| value}.to_h.keys.reverse
    # h.sort_by {|_key, value| value}.to_h.keys.reverse

    @leaderboard = @drinks.sort_by do |drink|
      drink.votes.count
    end.reverse

    render("drink_leaderboard/index.html.erb")
  end
end