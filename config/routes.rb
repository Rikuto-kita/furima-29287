Rails.application.routes.draw do
  devise_for :users
  resources :users
 root to: "items#index"
 post 'users/create',to: 'users#create'
end
