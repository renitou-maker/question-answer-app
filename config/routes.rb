Rails.application.routes.draw do
  root 'questions#index'
  resources :users 
  resources :questions 
  resources :answers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
