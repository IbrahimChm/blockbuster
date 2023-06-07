Rails.application.routes.draw do
  root 'clientes#index'

  get 'catalogo', to: 'peliculas#index', as: 'catalogo_peliculas'

  resources :clientes
  resources :peliculas

  get '/buscar', to: 'clientes#buscar', as: 'buscar'
  get 'clientes/:cliente_id/peliculas_arrendadas', to: 'clientes#peliculas_arrendadas', as: 'peliculas_arrendadas_cliente'

 
end



