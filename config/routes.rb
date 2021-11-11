Rails.application.routes.draw do
  root :to => redirect('/login')
  
  resources :accounts

  get '/login' , to: "session#index"
  post '/login', to: "session#create"
  post '/logout', to: 'session#destroy'
  get '/logout', to: 'session#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
