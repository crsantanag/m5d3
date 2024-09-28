class MoviesController < ApplicationController
  def index
  end

  def new
    @movie = Movie.new
  end

  def listar
    @movie = Movie.all
  end

  def create
    @movie = Movie.new(movies_params)
    if @movie.save
      redirect_to movies_mostrar_path(id: @movie.id, message: "creada")
    else
      render :new
    end
  end

  def mostrar
    @movie = Movie.find(params[:id])
    @message = params[:message]
  end

  private
  
  def movies_params
    params.require(:movie).permit(:name, :director, :synopsis)
  end
end
