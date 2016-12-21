Rails.application.routes.draw do
  root :to => 'welcome#index'
  resources :products
  resources :users
  resources :welcome
  resources :favorites, except: [:update, :show]
  resources :items


  post 'sessions/login_attempt' => 'sessions#login_attempt'
  delete 'sessions' => 'sessions#destroy'

  resources :sessions, except: :destroy

end
