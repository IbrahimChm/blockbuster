Rails.application.routes.draw do
  root 'clientes#index'

  get 'catalogo', to: 'peliculas#index', as: 'catalogo_peliculas'

  resources :clientes
  resources :peliculas

  get '/buscar', to: 'clientes#buscar', as: 'buscar'
  
  resources :clientes do
    get 'peliculas_arrendadas', on: :member
  end
  
  
  
end



