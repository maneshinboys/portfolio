Rails.application.routes.draw do
  get 'animes/index'
  get 'animes/new'
  get 'animes/show'
  get 'animes/edit'
  get 'users/show'
  get 'users/edit'
  devise_for :users
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'
  resources :users, only: [:show, :edit]
end