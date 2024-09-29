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
      movie_data = @movie.attributes.slice("id", "name", "director", "synopsis")
      session[:movie_data] = movie_data
        redirect_to movies_show_path(message: "creada")
    else
        render :new
    end
  end

  def remove
    @movie = Movie.new
  end

  def delete
    @movie = Movie.find_by(id: params[:movie][:id])
    if @movie
      movie_data = @movie.attributes.slice("id", "name", "director", "synopsis")
      session[:movie_data] = movie_data
      if @movie.destroy
        redirect_to movies_show_path(message: "eliminada")
      else
        render :delete
      end
    else
      redirect_to movies_noexiste_path
    end
  end

  def show
    @movie = session[:movie_data]
    @message = params[:message]
    session.delete(:movie_data)
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
