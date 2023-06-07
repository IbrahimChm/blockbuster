class PeliculasController < ApplicationController
  def index
    @peliculas = Pelicula.all
  end

  def show
    @pelicula = Pelicula.find(params[:id])
  end

  def new
    @pelicula = Pelicula.new
  end

  def create
    @pelicula = Pelicula.new(pelicula_params)
    if @pelicula.save
      redirect_to catalogo_peliculas_path, notice: 'Película creada exitosamente.'
    else
      render :new
    end
  end
  

  def edit
    @pelicula = Pelicula.find(params[:id])
  end

  def update
    @pelicula = Pelicula.find(params[:id])
    if @pelicula.update(pelicula_params)
      redirect_to peliculas_path, notice: 'Película actualizada exitosamente.'
    else
      render :edit
    end
  end
  
  def destroy
    pelicula = Pelicula.find(params[:id])

    # Eliminar los registros de arriendo relacionados con la película
    Arriendo.where(pelicula_id: pelicula.id).destroy_all

    # Eliminar la película
    pelicula.destroy

    redirect_to peliculas_path
  end

  private

  def pelicula_params
    params.require(:pelicula).permit(:titulo, :cliente_id)

  end
end


