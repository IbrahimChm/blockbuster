class ArriendoPeliculasController < ApplicationController
  def index
    @arriendo_peliculas = ArriendoPelicula.all
  end

  def show
    @arriendo_pelicula = ArriendoPelicula.find(params[:id])
  end

  def new
    @arriendo_pelicula = ArriendoPelicula.new(cliente_id: params[:cliente_id], pelicula_id: params[:pelicula_id])
  end

  def create
    @arriendo_pelicula = ArriendoPelicula.new(arriendo_pelicula_params)
    if @arriendo_pelicula.save
      redirect_to arriendo_peliculas_path, notice: 'Arriendo de película creado exitosamente.'
    else
      render :new
    end
  end

  def edit
    @arriendo_pelicula = ArriendoPelicula.find(params[:id])
  end

  def update
    @arriendo_pelicula = ArriendoPelicula.find(params[:id])
    if @arriendo_pelicula.update(arriendo_pelicula_params)
      redirect_to arriendo_peliculas_path, notice: 'Arriendo de película actualizado exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @arriendo_pelicula = ArriendoPelicula.find(params[:id])
    @arriendo_pelicula.destroy
    redirect_to arriendo_peliculas_path, notice: 'Arriendo de película eliminado exitosamente.'
  end

  private

  def arriendo_pelicula_params
    params.require(:arriendo_pelicula).permit(:cliente_id, :pelicula_id, :otro_atributo)
  end
end

  