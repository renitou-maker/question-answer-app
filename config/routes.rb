Rails.application.routes.draw do
  root 'questions#index'
  get '/signup', to: 'users#new'
  resources :users 
  resources :questions 
  resources :answers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
