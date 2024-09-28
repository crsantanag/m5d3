class SeriesController < ApplicationController
  def option
    @serie = Serie.new
  end

  def new
    @serie = Serie.new
  end

  def index
    @series = Serie.all
  end

  def create
    @serie = Serie.new(series_params)
    if  @serie.save
        redirect_to series_show_path(id: @serie.id, message: "creada")
    else
        render :new
    end
  end

  def show
    @serie = Serie.find(params[:id])
    @message = params[:message]
  end

  def search
    if params[:query].present?
      @series = Serie.where("name ILIKE :query OR director ILIKE :query OR synopsis ILIKE :query", query: "%#{params[:query]}%")
    else
      @series = []
    end
  end

  private

  def series_params
    params.require(:serie).permit(:name, :director, :synopsis)
  end
end
