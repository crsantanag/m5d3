class DocumentariesController < ApplicationController
  def index
  end

  def new
    @documentary = Documentary.new
  end

  def listar
    @documentary = Documentary.all
  end

  def create
    @documentary = Documentary.new(documentaries_params)
    if @documentary.save
      redirect_to documentaries_mostrar_path(id: @documentary.id, message: "creada")
    else
      render :new
    end
  end

  def mostrar
    @documentary = Documentary.find(params[:id])
    @message = params[:message]
  end

  private
  
  def documentaries_params
    params.require(:documentary).permit(:name, :director, :synopsis)
  end
end