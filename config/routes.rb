Rails.application.routes.draw do
  root 'clientes#index'

  get 'catalogo', to: 'peliculas#index', as: 'catalogo_peliculas'
  
  resources :peliculas

  resources :clientes do
    member do
      get 'peliculas_arrendadas', to: 'clientes#peliculas_arrendadas'
      post 'agregar_pelicula', to: 'clientes#agregar_pelicula'
    end
  end

  get '/buscar', to: 'clientes#buscar', as: 'buscar'
end





