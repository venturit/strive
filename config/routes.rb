Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Home
  root 'home#index'
  get 'users/search', to: 'users#search'
  get 'users/:id', to: 'users#show', as: 'user'

  

end
