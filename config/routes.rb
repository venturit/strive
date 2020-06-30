Rails.application.routes.draw do

  
  devise_for :users
   

  root 'home#index'
  
  get 'users/search', to: 'users#search'

  resources :users, only: [:show, :update ] do
    resources :strives, only: [:new, :create]
  end


  resources :requests, except:[:show]
  
  namespace :admin do
    resources :badges, except: :show
    resources :users
    resources :strive_categories, except: :show
    resources :strives
  end
  
  
end
