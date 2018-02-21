Rails.application.routes.draw do
  root 'welcome#index'
  get 'about', to: 'welcome#about'
  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, except: [:new]
  
  resources :articles do
  	resources :comments
  end
end
