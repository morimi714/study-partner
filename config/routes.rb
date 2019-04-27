Rails.application.routes.draw do
  root :to => "home#top"
  post "teachers/:id/update" => "teachers#update"
  get "teachers/:id/edit" => "teachers#edit"
  post "teachers/create" => "teachers#create"
  get "teachers/signup" => "teachers#new"
  get "teachers/index" => "teachers#index"
  get "teachers/:id" => "teachers#show"
  post "teachers/login" => "teachers#login"
  post "teachers/logout" => "teachers#logout"
  get "teachers/login" => "teachers#login_form"
  
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/:id" => "users#show"
  
end
