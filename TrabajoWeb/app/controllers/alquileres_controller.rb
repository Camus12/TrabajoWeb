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
  logger.debug params
    @estacionamiento = Estacionamiento.find(params[:id])
  end

end



