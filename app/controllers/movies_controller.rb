class MoviesController < ApplicationController
  def option
    @movie = Movie.new
  end

  def new
    @movie = Movie.new
  end

  def index
    @movies = Movie.all
  end

  def create
    @movie = Movie.new(movies_params)
    if  @movie.save
        redirect_to movies_show_path(id: @movie.id, message: "creada")
    else
        render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @message = params[:message]
  end

  def search
    if params[:query].present?
      @movies = Movie.where("name ILIKE :query OR director ILIKE :query OR synopsis ILIKE :query", query: "%#{params[:query]}%")
    else
      @movies = []
    end
  end


  private

  def movies_params
    params.require(:movie).permit(:name, :director, :synopsis)
  end
end
