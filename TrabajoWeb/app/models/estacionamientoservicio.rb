class Estacionamientoservicio < ApplicationRecord
	validates :serviciosadicionale_id, :presence => { message: "es requerido" }
	validates :tarifa, :presence => { message: "es requerido" }

  	belongs_to :estacionamiento
  	belongs_to :serviciosadicionale
end
