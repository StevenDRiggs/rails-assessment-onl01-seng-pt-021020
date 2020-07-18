Rails.application.routes.draw do
  root 'application#welcome'

  get '/genres/:id/delete', to: 'genres#delete', as: 'delete_genre'
  delete '/genres/:id', to: 'genres#destroy', as: 'destroy_genre'
  resources :genres, except: [:destroy]

  get '/authors/:id/delete', to: 'authors#delete', as: 'delete_author'
  delete '/authors/:id', to: 'authors#destroy', as: 'destroy_author'
  resources :authors, except: [:destroy]

  get '/books/:id/delete', to: 'books#delete', as: 'delete_book'
  delete '/books/:id', to: 'books#destroy', as: 'destroy_book'
  resources :books, except: [:destroy]

  get '/signup', to: 'users#new'
  resources :users, except: [:new]

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#logout'
  post '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
