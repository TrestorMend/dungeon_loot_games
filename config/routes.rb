Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'products#index'
  
  get '/:id' => 'products#show', as: 'product',  id: /\d+/
end
