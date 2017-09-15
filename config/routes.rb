Rails.application.routes.draw do
  # Static Pages
  get '/about', to: 'pages#about', as: :about_page
  get '/home', to: 'pages#home', as: :home_page

  resources :users

  root 'pages#home'
end
