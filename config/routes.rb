Rails.application.routes.draw do

  devise_for :users
  # Static Pages
  get '/about', to: 'pages#about', as: :about_page
  get '/home', to: 'pages#home', as: :home_page

  root 'pages#home'
end
