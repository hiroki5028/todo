Rails.application.routes.draw do
  # get 'sessions/new'

  root 'pages#top'
  resources :tasks, except: :new
  resources :categories, except: :new
  post '/taskid/', to: 'taskids#index'
  get '/sign_up/', to: 'users#new'
  resources :users, only: [:create, :destroy]

  get    '/login/', to: 'sessions#new'
  post   '/login/', to: 'sessions#create'
  delete '/logout/', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
