Rails.application.routes.draw do

  # Static Pages
  get '/about', to: 'pages#about', as: :about_page
  get '/home', to: 'pages#home', as: :home_page

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'
end
