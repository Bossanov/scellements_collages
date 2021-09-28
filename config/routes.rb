Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :articles, except: :index
  resources :profiles

get 'pages/client'
get 'pages/admin'

end
