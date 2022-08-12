Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users

  resources :user_stocks, only: %i[create destroy]
  resources :friendships, only: %i[create destroy]

  get 'search_stock', to: 'stocks#search'

  get 'my_portfolio', to: 'users#my_portfolio'
  get 'my_friends', to: 'users#my_friends'
  get 'search_friend', to: 'users#search'
end
