Rails.application.routes.draw do
  root :to => 'welcome#index'
  resources :products, only: :index
  resources :users, except: :destroy
  resources :welcome, only: :index
  resources :favorites, except: [:update, :show]
  resources :items, only: [:new, :create]


  post 'sessions/login_attempt' => 'sessions#login_attempt'
  delete 'sessions' => 'sessions#destroy'

  resources :sessions, only: [:new, :create]

end
