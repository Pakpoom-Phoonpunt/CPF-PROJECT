Rails.application.routes.draw do
  root :to => redirect('/login')
  
  resources :accounts,:tasks_manage

  get '/accounts/:id/dashboard' , to: "accounts#dashboard"
  get "/accounts/:id/mytasks" , to: "accounts#mytasks"
  get '/accounts/:id/dashboard/manage', to: "accounts#manage_shift" 

  get '/accounts/:id/dashboard/:department' , to: "accounts#dashboard"
  get '/accounts/:id/adminmanagepage' , to: "accounts#adminmanage"

  get '/accounts/:id/dashboard/tasks_manage/:departmentName/:date/:shift', to: "tasks_manage#show"
  post '/accounts/:id/dashboard/tasks_manage/:departmentName/:date/:shift', to: "tasks_manage#manage_shift"
  
  get '/login' , to: "session#index"
  post '/login', to: "session#create"
  post '/logout', to: 'session#destroy'
  get '/logout', to: 'session#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
