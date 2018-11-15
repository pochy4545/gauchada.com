Rails.application.routes.draw do
  resources :categories
  resources :buys
  resources :categoria
  resources :gauchadas
  
  get 'index/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #ruta de inicio devise
  root to: "index#index"
  #resources :menu 
  get "postularse/new"
  post "postularse/create"
  get "postularse/:id" => "postularse#show", :as => :post
end
