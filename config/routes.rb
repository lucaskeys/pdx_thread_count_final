Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "user/registrations" }
  resources :about, :only => [:index]
  resources :user_stores, except: [:show, :edit, :update]
  resources :users, only: [:show]
  resources :designer_stores, except: [:show, :edit, :update]
  resources :article_stores, except: [:show, :edit, :update]
  resources :articles
  resources :stores
  resources :designers
  resources :stores do
    resources :store_announcements
  end
  resources :stores do
    resources :reviews
  end

  get 'my_stores', to: 'users#my_stores'
  get 'my_profile', to: 'users#my_profile'
  get 'search_stores', to: 'stores#search'
  get 'search_articles', to: 'articles#search'
  # post 'add_store', to: 'stores#add_store'
  post 'add_stores', to: 'designers#add_stores'
  root 'home#index'
  resources :welcome, :only => [:index]
end
