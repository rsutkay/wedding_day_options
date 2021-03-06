class DrinksController < ApplicationController
  before_action :current_user_must_be_drink_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_drink_user
    drink = Drink.find(params[:id])

    unless current_user == drink.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Drink.ransack(params[:q])
    @drinks = @q.result(:distinct => true).includes(:user, :drink_votes, :category, :votes).page(params[:page]).per(10)

    render("drinks/index.html.erb")
  end

  def show
    @drink_vote = DrinkVote.new
    @drink = Drink.find(params[:id])

    render("drinks/show.html.erb")
  end

  def new
    @drink = Drink.new

    render("drinks/new.html.erb")
  end

  def create
    @drink = Drink.new

    @drink.name = params[:name]
    @drink.category_id = params[:category_id]
    @drink.user_id = params[:user_id]

    save_status = @drink.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/drinks/new", "/create_drink"
        redirect_to("/drink_leaderboard")
      else
        redirect_back(:fallback_location => "/", :notice => "Beverage created successfully.")
      end
    else
      render("drinks/new.html.erb")
    end
  end

  def edit
    @drink = Drink.find(params[:id])

    render("drinks/edit.html.erb")
  end

  def update
    @drink = Drink.find(params[:id])

    @drink.name = params[:name]
    @drink.category_id = params[:category_id]
    @drink.user_id = params[:user_id]

    save_status = @drink.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/drinks/#{@drink.id}/edit", "/update_drink"
        redirect_to("/drinks/#{@drink.id}", :notice => "Beverage updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Beverage updated successfully.")
      end
    else
      render("drinks/edit.html.erb")
    end
  end

  def destroy
    @drink = Drink.find(params[:id])

    @drink.destroy

    if URI(request.referer).path == "/drinks/#{@drink.id}"
      redirect_to("/", :notice => "Beverage deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Beverage deleted.")
    end
  end
end
