class EstacionamientoimagensController < ApplicationController
	def create
	    @estacionamiento = Estacionamiento.find(params[:estacionamiento_id])
	    @imagen = @estacionamiento.estacionamientoimagens.create(imagen_params)
	    redirect_to estacionamiento_path(@estacionamiento)
	end
       
	def destroy
	    @estacionamiento = Estacionamiento.find(params[:estacionamiento_id])
	    @imagen = @estacionamiento.estacionamientoimagens.find(params[:id])
	    @imagen.destroy
	    redirect_to estacionamiento_path(@estacionamiento)
	end
        
private
	def imagen_params
		params.require(:estacionamientoimagen).permit(:estacionamiento_id, :foto)
	end
end
