class ClientesController < ApplicationController
  def index
    @clientes = Cliente.all
  end

  def show
    @cliente = Cliente.find(params[:id])
  end

  def new
    @cliente = Cliente.new
  end

  def create
    @cliente = Cliente.new(cliente_params)
    if @cliente.save
      redirect_to clientes_path, notice: 'Cliente creado exitosamente.'
    else
      render :new
    end
  end

  def edit
    @cliente = Cliente.find(params[:id])
  end

  def update
    @cliente = Cliente.find(params[:id])
    if @cliente.update(cliente_params)
      redirect_to clientes_path, notice: 'Cliente actualizado exitosamente.'
    else
      render :edit
    end
  end

  def buscar
    query = params[:query]
    @clientes = Cliente.left_outer_joins(:arriendos)
                       .select('clientes.*, arriendos.id AS arriendo_id, arriendos.pelicula_id AS pelicula_arrendada_id')
                       .where("clientes.nombre ILIKE :query OR arriendos.pelicula_id IN (SELECT id FROM peliculas WHERE titulo ILIKE :query)", query: "%#{query}%")
    @peliculas = Pelicula.where("titulo ILIKE :query", query: "%#{query}%")
  end
  

  def destroy
    @cliente = Cliente.find(params[:id])
    @cliente.destroy
    redirect_to clientes_path, notice: 'Cliente eliminado exitosamente.'
  end

  def peliculas_arrendadas
    @cliente = Cliente.find(params[:id])
    @arriendos = @cliente.arriendos.includes(:pelicula) # Incluye las películas en la consulta
    @arriendo_pelicula = Arriendo.new(cliente_id: @cliente.id) # Utiliza el modelo Arriendo en lugar de ArriendoPelicula
  end
  
  def agregar_pelicula
    @cliente = Cliente.find(params[:id])
    @arriendo_pelicula = @cliente.arriendos.build(agregar_pelicula_params)
    if @arriendo_pelicula.save
      redirect_to peliculas_arrendadas_cliente_path(@cliente), notice: 'Película agregada correctamente.'
    else
      render :peliculas_arrendadas
    end
  end
  
  private
  
  def agregar_pelicula_params
    params.require(:arriendo).permit(:pelicula_id) # Cambia :arriendo_pelicula por :arriendo
  end

  def cliente_params
    params.require(:cliente).permit(:nombre, pelicula_ids: [])
  end

  def arriendo_pelicula_params
    params.require(:arriendo).permit(:pelicula_id)
  end

end






