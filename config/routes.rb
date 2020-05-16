Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'users/create'
  get 'works/index'
  get 'works/show'
  get 'works/edit'
  get 'works/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
