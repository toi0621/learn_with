Rails.application.routes.draw do

 devise_for :users
 root to: 'home#top'

 get '/search', to: 'searchs#search'
 resources :posts do
  resource :favorites, only:[:create, :destroy]
  resources :comments, only:[:create, :destroy]
 end

 resources :users do
  resources :users, only:[:edit, :update, :index, :show]
  resource :relationships, only:[:create, :destroy]
  get :followers, on: :member
  get :followings, on: :member
 end


end
