class EstacionamientoserviciosController < ApplicationController
	def create
	    @estacionamiento = Estacionamiento.find(params[:estacionamiento_id])
	    @servicio = @estacionamiento.estacionamientoservicios.create(servicio_params)
	    redirect_to :controller => :serviciosadicionales, :action => :estaclista, :id => @estacionamiento.id
	end
    
	def destroy
	    @estacionamiento = Estacionamiento.find(params[:estacionamiento_id])
	    @servicio = @estacionamiento.estacionamientoservicios.find(params[:id])
	    @servicio.destroy
	    redirect_to :controller => :serviciosadicionales, :action => :estaclista, :id => @estacionamiento.id
	end
    
private
	def servicio_params
		params.require(:estacionamientoservicio).permit(:estacionamiento_id, :serviciosadicionale_id , :tarifa)
	end

end
