class DrinkVotesController < ApplicationController
  before_action :current_user_must_be_drink_vote_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_drink_vote_user
    drink_vote = DrinkVote.find(params[:id])

    unless current_user == drink_vote.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @drink_votes = DrinkVote.page(params[:page]).per(10)

    render("drink_votes/index.html.erb")
  end

  def show
    @drink_vote = DrinkVote.find(params[:id])

    render("drink_votes/show.html.erb")
  end

  def new
    @drink_vote = DrinkVote.new

    render("drink_votes/new.html.erb")
  end

  def create
    @drink_vote = DrinkVote.new

    @drink_vote.user_id = params[:user_id]
    @drink_vote.drink_id = params[:drink_id]

    save_status = @drink_vote.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/drink_votes/new", "/create_drink_vote"
        redirect_to("/drink_votes")
      else
        redirect_back(:fallback_location => "/", :notice => "Drink vote created successfully.")
      end
    else
      render("drink_votes/new.html.erb")
    end
  end

  def edit
    @drink_vote = DrinkVote.find(params[:id])

    render("drink_votes/edit.html.erb")
  end

  def update
    @drink_vote = DrinkVote.find(params[:id])
    @drink_vote.drink_id = params[:drink_id]

    save_status = @drink_vote.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/drink_votes/#{@drink_vote.id}/edit", "/update_drink_vote"
        redirect_to("/drink_votes/#{@drink_vote.id}", :notice => "Drink vote updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Drink vote updated successfully.")
      end
    else
      render("drink_votes/edit.html.erb")
    end
  end

  def destroy
    @drink_vote = DrinkVote.find(params[:id])

    @drink_vote.destroy

    if URI(request.referer).path == "/drink_votes/#{@drink_vote.id}"
      redirect_to("/", :notice => "Drink vote deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Drink vote deleted.")
    end
  end
end
