Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :books, only:[:create,:index,:show,:edit,:update,:destroy] do
    resource :likes, only: [:create, :destroy]
    resources :book_comments, only: [:create,:destroy]
  end
  resources :users, only: [:show,:index,:edit,:update,:create,:new]
end
