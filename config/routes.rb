Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#construction'
  resources :articles, except: :index
  resources :profiles
  resources :messages

  get 'pages/client'
  get 'pages/admin'
  get 'pages/resultsearch'
  get 'pages/home'
  get 'pages/contact'
  get 'search', to: 'search#search'
  get 'supprimer_article', to: 'articles#supprimer_article'
  get 'effacer_message', to: 'messages#effacer_message'
end
