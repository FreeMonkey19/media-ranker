Rails.application.routes.draw do
  
  root to: "works#main", as: "root"

  # creating a vote only happens via works route
  resources :works do
    resources :votes, only: [:create]
  end

  resources :users

  # no route for creating a vote via votes route
  resources :votes, except: [:create]

  get "/login", to: "users#login_form", as: "login"
  post "/login", to: "users#login"
  post "/logout", to: "users#logout", as: "logout"

end
