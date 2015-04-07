Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'products#index'
  
  get '/:id' => 'products#show', as: 'product',  id: /\d+/
  get '/category/:id' => 'products#category', as: 'category',  id: /\d+/
  get '/pages/:title' => 'page#show', as: 'page'
  post 'search_results' => 'products#search_results', :as => 'search_results'
end
