Rails.application.routes.draw do
  root :to => 'welcome#index'
  resources :products
  resources :users
  resources :welcome
  resources :favorites

  get 'sessions/new' => 'sessions#new'
  post 'sessions/login_attempt' => 'sessions#login_attempt'
  delete 'sessions' => 'sessions#destroy'

  resources :sessions, except: :destroy

  # get '/results' => 'products#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
