Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users

  resources :user_stocks, only: [:create, :destroy]

  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
end
