class DrinkVotesController < ApplicationController
  before_action :current_user_must_be_drink_vote_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_drink_vote_user
    drink_vote = DrinkVote.find(params[:id])

    unless current_user == drink_vote.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = DrinkVote.ransack(params[:q])
    @drink_votes = @q.result(:distinct => true).includes(:user, :drink).page(params[:page]).per(10)

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
    
    @drinks = Drink.all
    @leaderboard = @drinks.sort_by do |drink|
      drink.votes.count
    end.reverse

    save_status = @drink_vote.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/drink_votes/new", "/create_drink_vote"
        if current_user.votes.count == 2
          if current_user.song_votes.count == 1
            redirect_to("/drink_leaderboard", :notice => "Beverage vote entered! You only have 1 of your 3 beverage votes left, but you already voted for your song.")
          else
            redirect_to("/drink_leaderboard", :notice => "Beverage vote entered! You only have 1 of your 3 beverage votes left, and you still have 1 song vote left!")
          end
        elsif current_user.votes.count == 1
          if current_user.song_votes.count == 1
            redirect_to("/drink_leaderboard", :notice => "Beverage vote entered! You have 2 of your 3 beverage votes left, but you already voted for your song.")
          else
            redirect_to("/drink_leaderboard", :notice => "Beverage vote entered! You have 2 of your 3 beverage votes left, and you still have 1 song vote left!")
          end
        elsif current_user.votes.count == 3
          if current_user.song_votes.count == 1
            redirect_to("/drink_leaderboard", :notice => "Beverage vote entered! You have 0 of your 3 beverage votes left, and you already voted for your song :/")
          else
            redirect_to("/drink_leaderboard", :notice => "Beverage vote entered! You have 0 of your 3 beverage votes left, but you still have 1 song vote left!")
          end
        else
          if current_user.song_votes.count == 1
            redirect_to("/drink_leaderboard", :notice => "Beverage vote entered! You have 3 of your 3 beverage votes left, but you already voted for your song.")
          else
            redirect_to("/drink_leaderboard", :notice => "Beverage vote entered! You have 3 of your 3 beverage votes left, and you still have 1 song vote left!")
          end
        end
      else
        if current_user.votes.count == 2
          if current_user.song_votes.count == 1
            redirect_back(:fallback_location => "/", :notice => "Beverage vote entered! You only have 1 of your 3 beverage votes left, but you already voted for your song.")
          else
            redirect_back(:fallback_location => "/", :notice => "Beverage vote entered! You only have 1 of your 3 beverage votes left, and you still have 1 song vote left!")
          end
        elsif current_user.votes.count == 1
          if current_user.song_votes.count == 1
            redirect_back(:fallback_location => "/", :notice => "Beverage vote entered! You have 2 of your 3 beverage votes left, but you already voted for your song.")
          else
            redirect_back(:fallback_location => "/", :notice => "Beverage vote entered! You have 2 of your 3 beverage votes left, and you still have 1 song vote left!")
          end
        elsif current_user.votes.count == 3
          if current_user.song_votes.count == 1
            redirect_back(:fallback_location => "/", :notice => "Beverage vote entered! You have 0 of your 3 beverage votes left, and you already voted for your song :/")
          else
            redirect_back(:fallback_location => "/", :notice => "Beverage vote entered! You have 0 of your 3 beverage votes left, but you still have 1 song vote left!")
          end
        else
          if current_user.song_votes.count == 1
            redirect_back(:fallback_location => "/", :notice => "Beverage vote entered! You have 3 of your 3 beverage votes left, but you already voted for your song.")
          else
            redirect_back(:fallback_location => "/", :notice => "Beverage vote entered! You have 3 of your 3 beverage votes left, and you still have 1 song vote left!")
          end
        end
      end
    else
      render("drink_leaderboard/index.html.erb")
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
      redirect_to("/", :notice => "Beverage vote deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Beverage vote deleted.")
    end
  end
end
