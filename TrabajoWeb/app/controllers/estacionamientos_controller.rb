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
    @is_distrito = ""

    if params[:estacionamiento] != nil then
      ls_select = "SELECT * FROM estacionamientos"
      ls_where = ""

      @is_distrito = params[:estacionamiento][:distrito]
      @is_tipo = params[:estacionamiento][:tipo]
      @is_ubicacion = params[:estacionamiento][:ubicacion]

      if @is_distrito != "" then
        if ls_where = "" then
          ls_where = " WHERE lower(distrito) = '" + @is_distrito.downcase + "'"
        else
          ls_where = ls_where + " AND lower(distrito) = '" + @is_distrito.downcase + "'"
        end
      end
      
      if @is_tipo != "" then
        if ls_where = "" then
          ls_where = " WHERE tipo = '" + @is_tipo + "'"
        else
          ls_where = ls_where + " AND tipo = '" + @is_tipo + "'"
        end
      end

      if @is_ubicacion != "" then
        if ls_where = "" then
          ls_where = " WHERE ubicacion = '" + @is_ubicacion + "'"
        else
          ls_where = ls_where + " AND ubicacion = '" + @is_ubicacion + "'"
        end
      end

      ls_select = ls_select + ls_where
      @estacionamientos = Estacionamiento.find_by_sql(ls_select)

      ##Sirve para reemplazar los ? por parámetros
      #@estacionamientos = Estacionamiento.find_by_sql(["SELECT * FROM estacionamientos WHERE distrito LIKE ? AND tipo LIKE ? AND ubicacion LIKE ?", params[:estacionamiento][:distrito], params[:estacionamiento][:tipo], params[:estacionamiento][:ubicacion]])
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
   # @estacionamientos = Estacionamiento.find_by(distrito: "Miraflores")
@estacionamientos =Estacionamiento.where("distrito = ?", params[:upc][:distrito]  )
    #logger.debug params[:upc][:distrito]
    #logger.debug params[:distrito]
    #render layout: "cliente"
  end


private
  def estacionamiento_params
    params.require(:estacionamiento).permit(:nombredescriptivo, :direccion, :direcciongooglemaps, :distrito, :numerotelefono, :precioporhora, :largo, :ancho, :altura, :tipo, :ubicacion)
  end
end
