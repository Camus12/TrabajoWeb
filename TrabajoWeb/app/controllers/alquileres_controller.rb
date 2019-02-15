class AlquileresController < ApplicationController
  layout 'dueno'
  
  def lista
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



