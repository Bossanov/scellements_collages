Rails.application.routes.draw do

  get 'payments/new'
  get 'payments/thanks'
  resources :actualites
  resources :themes
  resources :publicities
  devise_for :users
  root to: 'pages#construction'
  resources :articles, except: :index
  resources :profiles
  resources :messages
  resources :publicities
  resources :actualites
  resources :charges, only: [:new, :create]
  resources :payments, only: [:new, :create]

  get 'payment-thanks', to: 'payments#thanks', as: 'payment_thanks'
  get 'pages/abonnement'
  get 'pages/actualite'
  get 'pages/client'
  get 'pages/admin'
  get 'pages/resultsearch'
  get 'pages/home'
  get 'pages/contact'
  get 'search', to: 'search#search'
  get 'supprimer_article', to: 'articles#supprimer_article'
  get 'supprimer_publicity', to: 'publicities#supprimer_publicity'
  get 'supprimer_theme', to: 'themes#supprimer_theme'
  get 'effacer_profile', to: 'profiles#effacer_profile'
  get 'effacer_message', to: 'messages#effacer_message'
  get 'supprimer_actualite', to: 'actualites#supprimer_actualite'
  get 'thanks', to: 'charges#thanks', as: 'thanks'
end
