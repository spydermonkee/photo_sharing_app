PhotoSharing::Application.routes.draw do
  resources :users
  resources :sessions
  root 'static_pages#index'
end
