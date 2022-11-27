Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users
  get 'homes/about' => 'homes#about', as: 'about'
  
  resources :users, only: [:show, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :destroy]
end