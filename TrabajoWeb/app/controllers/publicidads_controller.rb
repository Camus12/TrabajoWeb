class PublicidadsController < ApplicationController
  layout 'administrador'
  before_action :set_publicidad, only: [:show, :edit, :update, :destroy]

  # GET /comercials
  # GET /comercials.json


  def index
    @publicidads = Publicidad.all
  end

  # GET /comercials/1
  # GET /comercials/1.json
  def show
  end

  # GET /comercials/new
  def new
    @publicidad = Publicidad.new
  end

  # GET /comercials/1/edit
  def edit
  end

  # POST /comercials
  # POST /comercials.json
  def create
    @publicidad = Publicidad.new(publicidad_params)

    respond_to do |format|
      if @publicidad.save
        format.html { redirect_to @publicidad, notice: 'Se ingreso publicidad' }

      else
        format.html { render :new }

      end
    end

  end

  def update
    respond_to do |format|
      if @publicidad.update(publicidad_params)
        format.html { redirect_to @publicidad, notice: 'Publicidad Modificada.' }
        format.json { render :show, status: :ok, location: @publicidad }
  
    
      else
        format.html { render :edit }

      end
    end
  end


  def destroy
    @publicidad.destroy
    respond_to do |format|
      format.html { redirect_to publicidads_url, notice: 'Publicidad Eliminada' }
    end
  end

  private

    def set_publicidad

      @publicidad = Publicidad.find(params[:id])
    end

    def publicidad_params
      params.require(:publicidad).permit( :nombredescriptivo, :nombrecliente, :imagen, :tarifa, :ubicacion, :frecuencia, :fecha, :enlace, :estado, :detalles)
    end
end
