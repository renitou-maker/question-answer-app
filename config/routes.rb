Rails.application.routes.draw do
  get 'sessions/new'
  root 'questions#index'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/about', to: 'application#about'
  get '/contact', to: 'application#contact'
  resources :users 
  resources :questions do
    resources :answers
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
