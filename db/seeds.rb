require 'faker'

# Crear películas de muestra
10.times do
  titulo = Faker::Movie.title
  Pelicula.find_or_create_by(titulo: titulo)
end

# Crear clientes de muestra y asignar películas arrendadas
10.times do
  nombre = Faker::Name.name
  cliente = Cliente.find_or_create_by(nombre: nombre)
  peliculas_arrendadas = Pelicula.all.sample(4)
  peliculas_arrendadas.each do |pelicula|
    cliente.arriendos.find_or_create_by(pelicula: pelicula)
  end
end









