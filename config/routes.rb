Rails.application.routes.draw do
  root to: 'products#index'
  
  get '/:id' => 'products#show', as: 'product',  id: /\d+/
end
