Rails.application.routes.draw do
  root :to => 'welcome#index'
  resources :products
  resources :users
  resources :welcome
  resources :favorites
  resources :items

  get 'sessions/new' => 'sessions#new'
  post 'sessions/login_attempt' => 'sessions#login_attempt'
  delete 'sessions' => 'sessions#destroy'

  resources :sessions, except: :destroy

end
