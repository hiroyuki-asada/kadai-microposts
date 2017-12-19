Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
    end
    
    member do 
      get :favor_followings
    end
      
  end
   
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  
  #お気に入り機能
  resources :favorites, only: [:create, :destroy, :index]
  

end
