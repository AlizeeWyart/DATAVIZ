Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "atlas" => 'pages#atlas'
  get "find" => 'pages#find'
  get "about" => 'pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
