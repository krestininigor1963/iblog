Rails.application.routes.draw do
  
  get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static_pages#home'
  get  '/articles', to: 'articles#index'
  get  '/signup',   to: 'users#new'
  get  '/login',    to: 'sessions#new'
  post  '/login',    to: 'sessions#create'
  delete  '/logout',   to: 'sessions#destroy'

  resources :users
  resources :articles do
     resources :comments 
  end		
  
  resources :comments 
  
end
