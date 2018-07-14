class ArtistsController < ApplicationController
  def index
    @q = Artist.ransack(params[:q])
    @artists = @q.result(:distinct => true).includes(:songs).page(params[:page]).per(10)

    render("artists/index.html.erb")
  end

  def show
    @song = Song.new
    @artist = Artist.find(params[:id])

    render("artists/show.html.erb")
  end

  def new
    @artist = Artist.new

    render("artists/new.html.erb")
  end

  def create
    @artist = Artist.new

    @artist.name = params[:name]

    save_status = @artist.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/artists/new", "/create_artist"
        redirect_to("/artists")
      else
        redirect_back(:fallback_location => "/", :notice => "Artist created successfully.")
      end
    else
      render("artists/new.html.erb")
    end
  end

  def edit
    @artist = Artist.find(params[:id])

    render("artists/edit.html.erb")
  end

  def update
    @artist = Artist.find(params[:id])

    @artist.name = params[:name]

    save_status = @artist.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/artists/#{@artist.id}/edit", "/update_artist"
        redirect_to("/artists/#{@artist.id}", :notice => "Artist updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Artist updated successfully.")
      end
    else
      render("artists/edit.html.erb")
    end
  end

  def destroy
    @artist = Artist.find(params[:id])

    @artist.destroy

    if URI(request.referer).path == "/artists/#{@artist.id}"
      redirect_to("/", :notice => "Artist deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Artist deleted.")
    end
  end
end
