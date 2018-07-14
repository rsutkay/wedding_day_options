Rails.application.routes.draw do
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
