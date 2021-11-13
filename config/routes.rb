Rails.application.routes.draw do
  root :to => redirect('/login')
  
  resources :accounts,:tasks_manage

  get '/accounts/:id/dashboard' , to: "accounts#dashboard"
  get '/accounts/:id/dashboard/:department' , to: "accounts#dashboard"
  get '/accounts/:id/dashboard/:departmentId/mange_shift', to: "accounts#manage_shift"
  get '/accounts/:id/adminmanagepage' , to: "accounts#adminmanage"

  get '/tasks_manage/:departmentId', to: "tasks_manage#show"

  get '/login' , to: "session#index"
  post '/login', to: "session#create"
  post '/logout', to: 'session#destroy'
  get '/logout', to: 'session#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
