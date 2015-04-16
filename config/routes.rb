Rails.application.routes.draw do
  get 'order/create'

  get 'order/show'

  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'
  get 'carts/show'  
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'products#index'
  
  get '/:id' => 'products#show', as: 'product',  id: /\d+/
  get '/category/:id' => 'products#category', as: 'category',  id: /\d+/
  get '/pages/:title' => 'page#show', as: 'page'
  match 'search_results' => 'products#search_results',
        :as => 'search_results', :via => :post
  get '/order' => 'products#order'
  get '/new' => 'products#new'
  get '/recent' => 'products#recent'
end
