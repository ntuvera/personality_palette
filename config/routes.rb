Rails.application.routes.draw do
  root 'user_sessions#new'

  resources :user_sessions
  resources :users do
    resources :entries
  end

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  get '/portfolio' => 'user_sessions#portnew'
end
