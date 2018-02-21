Rails.application.routes.draw do
  root 'welcome#index'
  get 'about', to: 'welcome#about'
  get 'signup', to: 'users#new'
  
  resources :users, except: [:new]
  
  resources :articles do
  	resources :comments
  end
end
