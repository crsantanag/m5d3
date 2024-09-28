class SeriesController < ApplicationController
  def index
  end

  def new
    @serie = Serie.new
  end

  def listar
    @serie = Serie.all
  end

  def create
    @serie = Serie.new(series_params)
    if @serie.save
      redirect_to series_mostrar_path(id: @serie.id, message: "creada")
    else
      render :new
    end
  end

  def mostrar
    @serie = Serie.find(params[:id])
    @message = params[:message]
  end

  private

  def series_params
    params.require(:serie).permit(:name, :director, :synopsis)
  end
end
