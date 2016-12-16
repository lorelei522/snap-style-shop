Rails.application.routes.draw do
  resources :products
  resources :welcome
  root :to => 'welcome#index'


  get '/results' => 'products#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
