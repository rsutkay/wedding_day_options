class SongVotesController < ApplicationController
  before_action :current_user_must_be_song_vote_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_song_vote_user
    song_vote = SongVote.find(params[:id])

    unless current_user == song_vote.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = SongVote.ransack(params[:q])
    @song_votes = @q.result(:distinct => true).includes(:user, :song).page(params[:page]).per(10)

    render("song_votes/index.html.erb")
  end

  def show
    @song_vote = SongVote.find(params[:id])

    render("song_votes/show.html.erb")
  end

  def new
    @song_vote = SongVote.new

    render("song_votes/new.html.erb")
  end

  def create
    @song_vote = SongVote.new

    @song_vote.user_id = params[:user_id]
    @song_vote.song_id = params[:song_id]

    save_status = @song_vote.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/song_votes/new", "/create_song_vote"
        redirect_to("/song_votes")
      else
        redirect_back(:fallback_location => "/", :notice => "Song vote created successfully.")
      end
    else
      render("song_votes/new.html.erb")
    end
  end

  def edit
    @song_vote = SongVote.find(params[:id])

    render("song_votes/edit.html.erb")
  end

  def update
    @song_vote = SongVote.find(params[:id])
    @song_vote.song_id = params[:song_id]

    save_status = @song_vote.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/song_votes/#{@song_vote.id}/edit", "/update_song_vote"
        redirect_to("/song_votes/#{@song_vote.id}", :notice => "Song vote updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Song vote updated successfully.")
      end
    else
      render("song_votes/edit.html.erb")
    end
  end

  def destroy
    @song_vote = SongVote.find(params[:id])

    @song_vote.destroy

    if URI(request.referer).path == "/song_votes/#{@song_vote.id}"
      redirect_to("/", :notice => "Song vote deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Song vote deleted.")
    end
  end
end
