Rails.application.routes.draw do
  root to: 'static#index'
  get '/api' => redirect('/swagger/dist/index.html?url=/api-docs.json')

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/feed',   to: 'static#feed'


  resources :statistics
  resources :users
  resources :answers
  resources :questions
  resources :fields
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
