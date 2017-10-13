Rails.application.routes.draw do
  root 'pages#top'
  resources :tasks, except: :new

  post '/taskid/', to: 'taskids#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
