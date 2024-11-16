Rails.application.routes.draw do
  root "articles#index" # Define a página inicial para mostrar a lista de publicações

  resources :articles do
    resources :comments, only: [:create, :destroy, :show] # Permite adicionar e remover comentários nas publicações
  end
  

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  # Rotas para login e logout
  get '/login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout' => :destroy, to: 'sessions#destroy', as: 'logout'
  
end
