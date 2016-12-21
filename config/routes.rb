Rails.application.routes.draw do
  # remove routes that are not needed
  root :to => 'welcome#index'
  resources :products
  resources :users
  resources :welcome
  resources :favorites, except: :update

  # this route is redundant:
  get 'sessions/new' => 'sessions#new'
  post 'sessions/login_attempt' => 'sessions#login_attempt'
  delete 'sessions' => 'sessions#destroy'

  resources :sessions, except: :destroy

end
