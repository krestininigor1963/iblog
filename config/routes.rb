Rails.application.routes.draw do
  
  root 'static_pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "articles/index"
  #get '/new', to: 'comments#new'


  #get "/articles", to: 'articles#index'
  #get "/articles/:id", to: 'articles#show'
  resources :articles do
     resources :comments 
  end		
  
  
end
