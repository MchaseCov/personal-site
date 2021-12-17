Rails.application.routes.draw do
  resources :projects, only: %i[index show]
  root 'pages#main'
  get '/main', to: 'pages#main'
  get '/about', to: 'pages#about'

  get '/dark_mode', to: 'application#dark_mode', as: 'dark_mode'
  get '/light_mode', to: 'application#light_mode', as: 'light_mode'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
