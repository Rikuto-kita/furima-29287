Rails.application.routes.draw do
  devise_for :users
  resources :users
  #post 'sign_up', to: 'users#create'
end
