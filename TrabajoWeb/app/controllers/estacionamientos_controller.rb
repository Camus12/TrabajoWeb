class EstacionamientosController < ApplicationController
  layout 'dueno', except: [:buscar, :buscar_detalle]

  def new
    @estacionamiento = Estacionamiento.new
  end

  def create
    @estacionamiento = Estacionamiento.new(estacionamiento_params)

    if @estacionamiento.save
      redirect_to :action => :show, :id => @estacionamiento.id
    else
      render "new"
    end
  end

  def edit
    @estacionamiento = Estacionamiento.find(params[:id])
  end

  def update
    @estacionamiento = Estacionamiento.find(params[:id])

    #if @estacionamiento.update_attributes(params[estacionamiento_params])
    if @estacionamiento.update(estacionamiento_params)
      redirect_to :action => :show, :id => @estacionamiento.id
    else
      render 'edit'
    end
  end

  def destroy
    @estacionamiento = Estacionamiento.find(params[:id])
    @estacionamiento.destroy

    redirect_to :action => :index
  end
  
  def show
    @estacionamiento = Estacionamiento.find(params[:id])
  end

  def index
    
    if params[:estacionamiento] != nil then
      @estacionamientos = Estacionamiento.find_by_sql(["SELECT * FROM estacionamientos WHERE distrito LIKE ? AND tipo LIKE ? AND ubicacion LIKE ?", params[:estacionamiento][:distrito], params[:estacionamiento][:tipo], params[:estacionamiento][:ubicacion]])
    else
      @estacionamientos = Estacionamiento.all

      ##Sirve para obtener los primeros N registros
      #@estacionamientos = Estacionamiento.take(0)
    end
    
  end

  
  def buscar
    render layout: "cliente"
  end

  def buscar_detalle
    render layout: "cliente"
  end


private
  def estacionamiento_params
    params.require(:estacionamiento).permit(:nombredescriptivo, :direccion, :direcciongooglemaps, :distrito, :numerotelefono, :precioporhora, :largo, :ancho, :altura, :tipo, :ubicacion)
  end
end
