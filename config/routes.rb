Rails.application.routes.draw do
  resources :movies
  root :to => redirect('/movies')
  post 'logout' => 'sessions#destroy'
  get  'auth/failure' => 'sessions#failure' 
  get  'auth/:provider/callback' => 'sessions#create'
  get  'auth/twitter', :as => 'login'
end
