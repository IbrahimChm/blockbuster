require 'faker'

# Crear películas de muestra
10.times do
  Pelicula.create(titulo: Faker::Movie.title)
end

# Crear clientes de muestra y asignar películas arrendadas
10.times do
  cliente = Cliente.create(nombre: Faker::Name.name)
  peliculas_arrendadas = Pelicula.all.sample(4)  # Seleccionar 3 películas al azar como películas arrendadas
  peliculas_arrendadas.each do |pelicula|
    Arriendo.create(cliente: cliente, pelicula: pelicula)
  end
end








