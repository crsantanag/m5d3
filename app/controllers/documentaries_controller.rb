class DocumentariesController < ApplicationController
  def option
  end

  def new
    @documentary = Documentary.new
  end

  def index
    @documentaries = Documentary.all
  end

  def create
    @documentary = Documentary.new(documentaries_params)
    if @documentary.save
      redirect_to documentaries_show_path(id: @documentary.id, message: "creada")
    else
      render :new
    end
  end

  def show
    @documentary = Documentary.find(params[:id])
    @message = params[:message]
  end

  private

  def documentaries_params
    params.require(:documentary).permit(:name, :director, :synopsis)
  end
end
