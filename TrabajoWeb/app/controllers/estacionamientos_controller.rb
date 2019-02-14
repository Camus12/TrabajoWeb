class EstacionamientosController < ApplicationController
  layout 'dueno', except: [:buscar, :buscar_detalle]

  def new
    @estacionamiento = Estacionamiento.new
    @is_direcciongooglemaps = ""
  end

  def create
    @estacionamiento = Estacionamiento.new(estacionamiento_params)
    @estacionamiento.codigopersona = session[:persona_id]

    if @estacionamiento.save
      redirect_to :action => :show, :id => @estacionamiento.id
    else
      render "new"  
    end
  end

  def edit
    @estacionamiento = Estacionamiento.find(params[:id])
    @is_direcciongooglemaps = @estacionamiento.direcciongooglemaps
  end

  def update
    @estacionamiento = Estacionamiento.find(params[:id])
    @estacionamiento.codigopersona = session[:persona_id]

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
    @is_direcciongooglemaps = @estacionamiento.direcciongooglemaps
  end

  def index
    @is_distrito = ""

    if params[:estacionamiento] != nil then
      ls_select = "SELECT * FROM estacionamientos WHERE codigopersona = " + session[:persona_id].to_s
      ls_where = ""

      @is_distrito = params[:estacionamiento][:distrito]
      @is_tipo = params[:estacionamiento][:tipo]
      @is_ubicacion = params[:estacionamiento][:ubicacion]

      if @is_distrito != "" then
        ls_where = ls_where + " AND lower(distrito) = '" + @is_distrito.downcase + "'"
      end
      
      if @is_tipo != "" then
        ls_where = ls_where + " AND tipo = '" + @is_tipo + "'"
      end

      if @is_ubicacion != "" then
        ls_where = ls_where + " AND ubicacion = '" + @is_ubicacion + "'"
      end

      ls_select = ls_select + ls_where
      @estacionamientos = Estacionamiento.find_by_sql(ls_select)

      ##Sirve para reemplazar los ? por parámetros
      #@estacionamientos = Estacionamiento.find_by_sql(["SELECT * FROM estacionamientos WHERE distrito LIKE ? AND tipo LIKE ? AND ubicacion LIKE ?", params[:estacionamiento][:distrito], params[:estacionamiento][:tipo], params[:estacionamiento][:ubicacion]])
    else
      @estacionamientos = Estacionamiento.all.where("codigopersona = " + session[:persona_id].to_s)
      
      ##Sirve para obtener TODOS los registros
      #@estacionamientos = Estacionamiento.all

      ##Sirve para obtener los primeros N registros
      #@estacionamientos = Estacionamiento.take(0)
    end
    
  end

  
  def buscar
    render layout: "cliente"
  end

  def buscar_detalle
    render layout: "cliente"
    
    #@estacionamientos = Estacionamiento.find_by(distrito: "Miraflores")
    @estacionamientos =Estacionamiento.where("distrito = ?", params[:upc][:distrito]  )
    #logger.debug params[:upc][:distrito]
    #logger.debug params[:distrito]

    @distrito = ""

    if params[:upc] != nil then
      ls_select = "SELECT * FROM estacionamientos"
      ls_where = ""

      @distrito = params[:upc][:distrito]
      @tipo = params[:upc][:tipo]
      @ubicacion = params[:upc][:ubicacion]


      if @distrito != "" then
        if ls_where == "" then
          ls_where = " WHERE lower(distrito) = '" + @distrito.downcase + "'"
        else
          ls_where = ls_where + " AND lower(distrito) = '" + @distrito.downcase + "'"
        end
      end

      if @tipo != "" then
        if ls_where == "" then
          ls_where = " WHERE tipo = '" + @tipo + "'"
        else
          ls_where = ls_where + " AND tipo = '" + @tipo + "'"
        end
      end

      if @ubicacion != "" then
        if ls_where == "" then
          ls_where = " WHERE ubicacion = '" + @ubicacion + "'"
        else
          ls_where = ls_where + " AND ubicacion = '" + @ubicacion + "'"
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


private
  def estacionamiento_params
    params.require(:estacionamiento).permit(:codigopersona, :nombredescriptivo, :direccion, :direcciongooglemaps, :distrito, :numerotelefono, :precioporhora, :largo, :ancho, :altura, :tipo, :ubicacion)
  end
end
