Rails.application.routes.draw do
  # custom routes
  # this brings up the login form
  get "/login", to: "users#login_form", as: "login"
  post "/login", to: "users#login"
  post "/logout", to: "users#logout", as: "logout"
  get "/users/current", to: "users#current", as: "current_user"

  root to: "works#main", as: "root"

  resources :works
  resources :users

end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html




# get 'users/index'
# get 'users/show'
# get 'users/edit'
# get 'users/create'
# get '/works', to: "works#index", as work
# get 'works/show'
# get 'works/edit'
# get 'works/create'









# Rails.application.routes.draw do
#   get    "/books"          , to: "books#index",   as: :book
#   post   "/books"          , to: "books#create"
#   get    "/books/new"      , to: "books#new",     as: :new_book
#   get    "/books/:id"      , to: "books#show",    as: :book
#   patch  "/books/:id"      , to: "books#update"
#   put    "/books/:id"      , to: "books#update"
#   delete "/books/:id"      , to: "books#destroy"
#   get    "/books/:id/edit" , to: "books#edit",    as: :edit_book
# end
