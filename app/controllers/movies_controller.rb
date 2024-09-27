class MoviesController < ApplicationController
  # before_action :set_movie, only: %i[ new delete ]

  def index
  end

  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.all
  end

  def create
    @movie = Movie.new(movies_params)
    if @movie.save
      redirect_to movies_mostrar_path(movies_params, message: "creado")
    else
      render :new
    end
  end

  def delete
    @movie = Movie.find(@movie.id)
    movie_data = movie.attributes
    if @movie.destroy
      redirect_to movies_mostrar_path(movies_params, message: "eliminado")
    else
      render :eliminar
    end
  end

  def mostrar
    @movie   = movies_params
    @message = params[:message]
  end

  private
  # def set_movie
  #  @movie = Movie.find(params[:id])
  # end
  def movies_params
    params.require(:movie).permit(:id, :name, :director, :synopsis)
  end
end
