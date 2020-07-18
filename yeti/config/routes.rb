Rails.application.routes.draw do
  get 'favorite_authors/update'
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
  resources :users, except: [:new] do
    resources :authors, only: [:index, :show, :new, :create]
    resources :books, only: [:index, :show, :new, :create]
    resources :genres, only: [:index, :show, :new, :create]
  end

  patch '/users/:user_id/favorite_authors/:id', to: 'favorite_authors#update', as: 'update_author_notes'
  patch '/users/:user_id/favorite_books/:id', to: 'favorite_books#update', as: 'update_book_notes'
  patch '/users/:user_id/favorite_genres/:id', to: 'favorite_genres#update', as: 'update_genre_notes'

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#logout'
  post '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
