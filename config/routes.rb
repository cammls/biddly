Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  resources :products
root 'home#index'
  get '/register' => 'users#new'
  post '/register' => 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/account/:id', to: 'users#show', as: 'account'
  get '/account/:id/edit', to: 'users#edit', as: 'modify_account'
  patch '/account/:id', to: 'users#update'
  put '/account/:id', to: 'users#update'
  delete '/account/:id', to: 'users#destroy', as: 'delete_account'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
