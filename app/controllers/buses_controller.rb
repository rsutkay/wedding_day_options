class BusesController < ApplicationController
  before_action :current_user_must_be_bus_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_bus_user
    bus = Bus.find(params[:id])

    unless current_user == bus.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @buses = Bus.all

    render("buses/index.html.erb")
  end

  def show
    @bus = Bus.find(params[:id])

    render("buses/show.html.erb")
  end

  def new
    @bus = Bus.new

    render("buses/new.html.erb")
  end

  def create
    @bus = Bus.new

    @bus.need = params[:need]
    @bus.user_id = params[:user_id]
    @bus.passengers = params[:passengers]

    save_status = @bus.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/buses/new", "/create_bus"
        redirect_to("/buses")
      else
        redirect_back(:fallback_location => "/", :notice => "Bus created successfully.")
      end
    else
      render("buses/new.html.erb")
    end
  end

  def edit
    @bus = Bus.find(params[:id])

    render("buses/edit.html.erb")
  end

  def update
    @bus = Bus.find(params[:id])

    @bus.need = params[:need]
    @bus.user_id = params[:user_id]
    @bus.passengers = params[:passengers]

    save_status = @bus.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/buses/#{@bus.id}/edit", "/update_bus"
        redirect_to("/buses/#{@bus.id}", :notice => "Bus updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Bus updated successfully.")
      end
    else
      render("buses/edit.html.erb")
    end
  end

  def destroy
    @bus = Bus.find(params[:id])

    @bus.destroy

    if URI(request.referer).path == "/buses/#{@bus.id}"
      redirect_to("/", :notice => "Bus deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Bus deleted.")
    end
  end
end
