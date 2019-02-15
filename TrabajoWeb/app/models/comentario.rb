class Comentario < ApplicationRecord

  before_action :set_comentario, only: [:show, :edit, :update, :destroy]

  # GET /comercials
  # GET /comercials.json


  def index
    @comentarios = Comentario.all
  end

  # GET /comercials/1
  # GET /comercials/1.json
  def show
  end

  # GET /comercials/new
  def new
    @comentario = Comentario.new
  end

  # GET /comercials/1/edit
  def edit
  end

  # POST /comercials
  # POST /comercials.json
  def create
    @comentario = Comentario.new(comentario_params)

    respond_to do |format|
      if @comentario.save
        format.html { redirect_to @comentario, notice: 'Se ingreso comentario' }

      else
        format.html { render :new }

      end
    end

  end

  def update
    respond_to do |format|
      if @comentario.update(publicidad_params)
        format.html { redirect_to @comentario, notice: 'Comentario Modificada.' }
 
  
    
      else
        format.html { render :edit }

      end
    end
  end


  def destroy
    @Comentario.destroy
    respond_to do |format|
      format.html { redirect_to comentarios_url, notice: 'Comentario Eliminada' }
    end
  end

  private

    def set_publicidad

      @comentario = Comentario.find(params[:id])
    end

    def comentario_params
      params.require(:comentario).permit( :codigopersona, :codigoestacionamiento, :puntuacion, :comentario, :codigocomentariopadre)

    end
end
