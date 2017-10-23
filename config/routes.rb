Rails.application.routes.draw do
  get '/login',   to: 'sessions#login'
  post '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :recipes
  resources :users
  # resources :invites
  # resources :dinners
  # resources :courses
  get 'myprofile', to: 'users#myprofile', as: 'my_profile'
  get 'users/:id/new', to: 'users#newrecipe', as: 'new_user_recipe'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
