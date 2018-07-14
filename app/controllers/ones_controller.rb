class OnesController < ApplicationController
  def index
    @q = One.ransack(params[:q])
    @ones = @q.result(:distinct => true).includes(:user).page(params[:page]).per(10)

    render("ones/index.html.erb")
  end

  def show
    @one = One.find(params[:id])

    render("ones/show.html.erb")
  end

  def new
    @one = One.new

    render("ones/new.html.erb")
  end

  def create
    @one = One.new

    @one.user_id = params[:user_id]
    @one.name = params[:name]

    save_status = @one.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/ones/new", "/create_one"
        redirect_to("/ones")
      else
        redirect_back(:fallback_location => "/", :notice => "One created successfully.")
      end
    else
      render("ones/new.html.erb")
    end
  end

  def edit
    @one = One.find(params[:id])

    render("ones/edit.html.erb")
  end

  def update
    @one = One.find(params[:id])

    @one.user_id = params[:user_id]
    @one.name = params[:name]

    save_status = @one.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/ones/#{@one.id}/edit", "/update_one"
        redirect_to("/ones/#{@one.id}", :notice => "One updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "One updated successfully.")
      end
    else
      render("ones/edit.html.erb")
    end
  end

  def destroy
    @one = One.find(params[:id])

    @one.destroy

    if URI(request.referer).path == "/ones/#{@one.id}"
      redirect_to("/", :notice => "One deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "One deleted.")
    end
  end
end
