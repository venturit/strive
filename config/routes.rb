Rails.application.routes.draw do

  devise_for :users

  root 'home#index'
  
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users/search', to: 'users#search'

  resources :requests
  
  namespace :admin do
    resources :badges, except: :show
    resources :users
    resources :strive_categories, except: :show
  end
  
  
end
