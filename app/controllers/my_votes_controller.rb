class MyVotesController < ApplicationController
  def index
    @drinkvotes = current_user.drink_votes.all
    @drinks = current_user.drinks.all
    @songvotes = current_user.song_votes.all

    render("my_votes/index.html.erb")
  end
end