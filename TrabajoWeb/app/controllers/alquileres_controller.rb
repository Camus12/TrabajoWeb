class AlquileresController < ApplicationController
  layout 'dueno'
  
  def lista
    @is_distrito = ""
    @is_estacionamiento = ""
    @is_fechadesde = Date.today.to_s
    @is_fechahasta = Date.today.to_s

    ls_select = "SELECT * FROM alquilers WHERE codigoestacionamiento IN (select id from estacionamientos where codigopersona = " + session[:persona_id].to_s

    ls_where = ""
    
    if params[:alquiler] != nil then
      @is_distrito = params[:alquiler][:distrito]
      @is_estacionamiento = params[:alquiler][:estacionamiento]
      @is_fechadesde = params[:alquiler][:fechadesde]
      @is_fechahasta = params[:alquiler][:fechahasta]
    end

    if @is_distrito != "" then
      ls_where = ls_where + " and lower(distrito) = '" + @is_distrito.downcase + "')"
    else
      ls_where = ls_where + ")"
    end
      
    if @is_estacionamiento != "" then
      ls_where = ls_where + " AND codigoestacionamiento = " + @is_estacionamiento
    end

    if @is_fechadesde != "" then
      ls_where = ls_where + " AND inicioalquiler >= date('" + @is_fechadesde + "')"
    end

    if @is_fechahasta != "" then
      ls_where = ls_where + " AND inicioalquiler < date('" + @is_fechahasta + "', '+1 days')"
    end

    ls_select = ls_select + ls_where

    @alquileres = Alquiler.find_by_sql(ls_select)
  end

  def new
  	
  end


  def create

    @alquiler = Alquiler.new(alquiler_params)

    respond_to do |format|
          if @alquiler.save
                format.html { rendirect_to @alquiler, notice: 'Alquiler was successsfully created.' }
                format.json { render :sho, status: :created, location: @alquiler }
          else
               format.html { render :new }
               format.json { render json: @alquiler.errors, status: :umprocessable_entity}
          end
     end
  end




  def registro
    
    @estacionamiento = Estacionamiento.find(params[:id])
    #logger.debug @estacionamiento  

   #@estacionamiento = Estacionamiento.new(estacionamiento_params)

    #if @estacionamiento.save
      #redirect_to :action => :show, :id => @estacionamiento.id
    #else
    #  render "new"    
    #end
  end

  def save_alquiler
    logger.debug params
     @alquiler = Alquiler.new(alquiler_params)
     
    logger.debug @alquiler     
    @alquiler.inicioalquiler =  DateTime.strptime(params[:upc][:fecha] + " " + params[:upc][:hora],"%d/%m/%Y %H:%M")
    #calcula fechafin , solo se suma una hora
    horas = 1
    @alquiler.finalquiler = (@alquiler.inicioalquiler + 60*60*horas )
     #calcula monto total
    @alquiler.preciototal = @alquiler.precioporhora * horas 
    
      if @alquiler.save
        redirect_to '/estacionamientos/buscar'
        #format.html { {:controller => :estacionamientos, :action => :buscar} notice: 'Registro exitoso' }

      else
        format.html { render :registro }

      end
    

  end
  def alquiler_params
      params.require(:upc).permit( :codigopersona, :codigoestacionamiento, :precioporhora)

    end

end



