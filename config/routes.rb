Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/dashboard',    to: 'dashboard#index'
  get    '/expenses', to: 'dashboard#expenses'
  get    '/bank_sync',    to: 'sessions#new'
  get    '/get_token',    to: 'sessions#get_token'
  post   '/login',        to: 'sessions#create'
  delete '/logout',       to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
