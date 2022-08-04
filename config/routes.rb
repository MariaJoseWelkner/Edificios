Rails.application.routes.draw do
  get 'inicio/index'
  root 'inicio#index'

  get "edificios",          to:"edificios#index",      as:"edificios"
  get "edificios/new",      to:"edificios#new",        as:"new_edificio"
  get "edificios/:id",      to:"edificios#show",       as:"edificio"
  get  "edificios/:id/edit",to:"edificios#edit",        as:"edit_edificio"
  post "edificios",         to:"edificios#create"
  patch "edificios/:id",    to:"edificios#update"
  put   "edificios/:id",    to:"edificios#update"
  delete "edificios/:id",   to:"edificios#destroy"   
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :departamentos
  # Defines the root path route ("/")
  # root "articles#index"
end
