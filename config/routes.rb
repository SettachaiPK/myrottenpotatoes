Rails.application.routes.draw do
  resources :movies
  root :to => redirect('/movies')
  post 'logout' => 'sessions#destroy'
  get  'auth/failure' => 'sessions#failure' 
  get  'auth/:provider/callback' => 'sessions#create'
  get  'auth/:provider' => 'sessions#new'
  get  'auth/twitter', :as => 'login'
  post '/movies/search_tmdb'
  post 'all_destroy' => 'movies#all_destroy' , :as => 'all_destroy'
end
