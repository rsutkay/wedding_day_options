Rails.application.routes.draw do
  root :to => "drinks#index"
  # Routes for the Bus resource:
  # CREATE
  get "/buses/new", :controller => "buses", :action => "new"
  post "/create_bus", :controller => "buses", :action => "create"

  # READ
  get "/buses", :controller => "buses", :action => "index"
  get "/buses/:id", :controller => "buses", :action => "show"

  # UPDATE
  get "/buses/:id/edit", :controller => "buses", :action => "edit"
  post "/update_bus/:id", :controller => "buses", :action => "update"

  # DELETE
  get "/delete_bus/:id", :controller => "buses", :action => "destroy"
  #------------------------------

  # Routes for the Song_vote resource:
  # CREATE
  get "/song_votes/new", :controller => "song_votes", :action => "new"
  post "/create_song_vote", :controller => "song_votes", :action => "create"

  # READ
  get "/song_votes", :controller => "song_votes", :action => "index"
  get "/song_votes/:id", :controller => "song_votes", :action => "show"

  # UPDATE
  get "/song_votes/:id/edit", :controller => "song_votes", :action => "edit"
  post "/update_song_vote/:id", :controller => "song_votes", :action => "update"

  # DELETE
  get "/delete_song_vote/:id", :controller => "song_votes", :action => "destroy"
  #------------------------------

  # Routes for the Artist resource:
  # CREATE
  get "/artists/new", :controller => "artists", :action => "new"
  post "/create_artist", :controller => "artists", :action => "create"

  # READ
  get "/artists", :controller => "artists", :action => "index"
  get "/artists/:id", :controller => "artists", :action => "show"

  # UPDATE
  get "/artists/:id/edit", :controller => "artists", :action => "edit"
  post "/update_artist/:id", :controller => "artists", :action => "update"

  # DELETE
  get "/delete_artist/:id", :controller => "artists", :action => "destroy"
  #------------------------------

  # Routes for the Song resource:
  # CREATE
  get "/songs/new", :controller => "songs", :action => "new"
  post "/create_song", :controller => "songs", :action => "create"

  # READ
  get "/songs", :controller => "songs", :action => "index"
  get "/songs/:id", :controller => "songs", :action => "show"

  # UPDATE
  get "/songs/:id/edit", :controller => "songs", :action => "edit"
  post "/update_song/:id", :controller => "songs", :action => "update"

  # DELETE
  get "/delete_song/:id", :controller => "songs", :action => "destroy"
  #------------------------------

  # Routes for the One resource:
  # CREATE
  get "/ones/new", :controller => "ones", :action => "new"
  post "/create_one", :controller => "ones", :action => "create"

  # READ
  get "/ones", :controller => "ones", :action => "index"
  get "/ones/:id", :controller => "ones", :action => "show"

  # UPDATE
  get "/ones/:id/edit", :controller => "ones", :action => "edit"
  post "/update_one/:id", :controller => "ones", :action => "update"

  # DELETE
  get "/delete_one/:id", :controller => "ones", :action => "destroy"
  #------------------------------

  # Routes for the Drink_vote resource:
  # CREATE
  get "/drink_votes/new", :controller => "drink_votes", :action => "new"
  post "/create_drink_vote", :controller => "drink_votes", :action => "create"

  # READ
  get "/drink_votes", :controller => "drink_votes", :action => "index"
  get "/drink_votes/:id", :controller => "drink_votes", :action => "show"

  # UPDATE
  get "/drink_votes/:id/edit", :controller => "drink_votes", :action => "edit"
  post "/update_drink_vote/:id", :controller => "drink_votes", :action => "update"

  # DELETE
  get "/delete_drink_vote/:id", :controller => "drink_votes", :action => "destroy"
  #------------------------------

  # Routes for the Category resource:
  # CREATE
  get "/categories/new", :controller => "categories", :action => "new"
  post "/create_category", :controller => "categories", :action => "create"

  # READ
  get "/categories", :controller => "categories", :action => "index"
  get "/categories/:id", :controller => "categories", :action => "show"

  # UPDATE
  get "/categories/:id/edit", :controller => "categories", :action => "edit"
  post "/update_category/:id", :controller => "categories", :action => "update"

  # DELETE
  get "/delete_category/:id", :controller => "categories", :action => "destroy"
  #------------------------------

  # Routes for the Drink resource:
  # CREATE
  get "/drinks/new", :controller => "drinks", :action => "new"
  post "/create_drink", :controller => "drinks", :action => "create"

  # READ
  get "/drinks", :controller => "drinks", :action => "index"
  get "/drinks/:id", :controller => "drinks", :action => "show"

  # UPDATE
  get "/drinks/:id/edit", :controller => "drinks", :action => "edit"
  post "/update_drink/:id", :controller => "drinks", :action => "update"

  # DELETE
  get "/delete_drink/:id", :controller => "drinks", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
