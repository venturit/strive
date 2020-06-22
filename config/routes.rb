Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Home
  root 'home#index'
  
  get 'users/search', to: 'users#search'
  
  resources :users

  

end
