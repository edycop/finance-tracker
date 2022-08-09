Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  get 'my_portfolio', to: 'users#my_portfolio'
  # get 'my_portfolio', to: 'stocks#index'
  get 'search_stock', to: 'stocks#search'
end
