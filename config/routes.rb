Rails.application.routes.draw do

  root to: "works#main", as: "root"

  # only create votes through works
  resources :works do
    resources :votes, only: [:create]
  end
  
  resources :users
  
  # don't be lazy with Resources
  resources :votes, except: [:create]

  # customized routes
  get "/login", to: "users#login_form", as: "login"
  post "/login", to: "users#login"
  post "/logout", to: "users#logout", as: "logout"

end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
