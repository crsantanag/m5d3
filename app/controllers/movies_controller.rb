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
        redirect_to movies_display_path(message: "creada")
    else
        render :new
    end
  end

  def search
      puts "SEARCH params *#{params[:id]}*"
      if params[:id].to_i.to_s == params[:id]
        redirect_to movies_edita_path(params[:id])
      end
  end

  def edita
    @movie_id = params[:id]  # Obtiene el ID del parámetro
    puts "EDITA - params *#{@movie_id}*"  # Para depuración

    # Aquí puedes buscar la película si lo deseas
    @movie = Movie.find_by(id: @movie_id)

    if @movie.nil?
      redirect_to movies_noexiste_path
    else
      render :edita
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie
      if @movie.update(movies_params)
        movie_data = {
          "id" => @movie.id,
          "name" => movies_params[:name],
          "director" => movies_params[:director],
          "synopsis" => movies_params[:synopsis]
        }
        session[:movie_data] = movie_data
        redirect_to movies_display_path(message: "actualizada")
      else
        render :edit
      end
    else
      redirect_to movies_noexiste_path
    end
  end
  # def show
  #  @movie = Movie.find_by(id: params[:id])
  #  if @movie
  #    redirect_to edit_movies_path(@movie)
  #  else
  #    redirect_to movies_noexiste_path
  #  end
  # end

  # def edit
  #  @movie = Movie.find(params[:id])
  # end

  def remove
  end

  def destroy_by_id
    @movie = Movie.find_by(id: params[:id])  # Busca la película por el ID ingresado.
    if  @movie
        movie_data = @movie.attributes.slice("id", "name", "director", "synopsis")
        session[:movie_data] = movie_data
        @movie.destroy
        puts session[:movie_data]  # Depuración
        redirect_to movies_display_path(message: "eliminada")
    else
        redirect_to movies_noexiste_path
    end
  end


  def display
    puts "Movie data: #{session[:movie_data]}"  # Depuración
    puts "Params: #{params[:id]}"  # Depuración

    @movie = session[:movie_data]
    @message = params[:message]
    session.delete(:movie_data)
  end

  def string
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
