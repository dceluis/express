Rails.application.routes.draw do
  # Static Pages
  root 'pages#home'
  get '/about', to: 'pages#about', as: :about_page
  get '/home', to: 'pages#home', as: :home_page

  resources :users
  resources :conversations, shallow: true, except: %i(create) do
    resources :messages
  end

  post 'conversations/:user_id', to: 'conversations#find_or_create'

  resource :session, only: %i{new create destroy}

  mount ActionCable.server => '/cable'
end
