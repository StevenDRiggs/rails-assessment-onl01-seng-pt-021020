Rails.application.routes.draw do
  get '/genres/:id/delete', to: 'genres#delete'
  resources :genres

  get '/authors/:id/delete', to: 'authors#delete'
  resources :authors

  get '/books/:id/delete', to: 'books#delete'
  resources :books

  get '/signup', to: 'users#new'
  resources :users, except: [:new]

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#logout'
  post '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
