Rails.application.routes.draw do
  root :to => redirect('/login')
  
  resources :accounts,:tasks_manage

  #Permission Worker
  get "/accounts/:id/mytasks" , to: "accounts#mytasks"

  #Permission Manager
  get '/accounts/:id/dashboard' , to: "accounts#dashboard"
  get '/accounts/:id/dashboard/manage', to: "accounts#manage_shift" 
  get '/accounts/:id/dashboard/:department' , to: "accounts#dashboard"
  get '/accounts/:id/dashboard/tasks_manage/:departmentName/:date/:shift', to: "tasks_manage#show"
  post '/accounts/:id/dashboard/tasks_manage/:departmentName/:date/:shift', to: "tasks_manage#manage_shift"
  
  #Permission ADMIN
  get '/accounts/:id/manage_Worker' , to: "accounts#adminmanage" 
  get '/accounts/:id/manage_factories' , to: "accounts#factory_manage"
  get '/manage_factories/edit/:facId', to: "accounts#editFactory"
  post '/manage_factories/edit/:facId', to: "accounts#create_department"
  get '/manage_factories/:facId/add_department', to: "accounts#add_department"
  #Login Mechanic
  get '/login' , to: "session#index"
  post '/login', to: "session#create"
  post '/logout', to: 'session#destroy'
  get '/logout', to: 'session#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
