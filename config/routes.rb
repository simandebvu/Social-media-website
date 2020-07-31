Rails.application.routes.draw do

  root 'posts#index'
  get 'friendships/new'
  get 'friendships/create'

  devise_for :users

  resources :users, only: [:index, :show] do
    resources :friendships, only: [:index]
    member do
      put 'accept', to: 'friendships#accept'
      post 'request_friendship', to: 'friendships#create'
      delete 'unfriend', to: 'friendships#destroy'
    end
  end
  
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
