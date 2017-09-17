Rails.application.routes.draw do
  # Static Pages
  root 'pages#home'
  get '/about', to: 'pages#about', as: :about_page
  get '/home', to: 'pages#home', as: :home_page

  resources :users
  resources :conversations, shallow: true do
    resources :messages
  end

  resource :session, only: %i{new create destroy}
end
