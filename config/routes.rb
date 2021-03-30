Rails.application.routes.draw do
  

  root 'static_pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/articles', to: 'articles#index'
  get '/signup', to: 'users#new'

  #get "/articles", to: 'articles#index'
  #get "/articles/:id", to: 'articles#show'
  #get "comment/:id", to: 'article_comments#edit' 
  resources :articles do
     resources :comments 
  end		
  
  resources :comments 
  
end
