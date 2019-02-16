class Serviciosadicionale < ApplicationRecord
	validates :tiposervicio, :presence => { message: "es requerido" }
	validates :descripcion, :presence => { message: "es requerido" }

	has_many :estacionamientoservicios, dependent: :destroy
	has_many :estacionamientos, through: :estacionamientoservicios
end
