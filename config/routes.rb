Rails.application.routes.draw do
  resources :works
  resources :users


 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end



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
