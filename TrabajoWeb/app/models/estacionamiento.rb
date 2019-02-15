class Estacionamiento < ApplicationRecord
	validates :nombredescriptivo, :presence => { message: "es requerido" }
	validates :direccion, :presence => { message: "es requerido" }
	validates :distrito, :presence => { message: "es requerido" }
	validates :precioporhora, :presence => { message: "es requerido" }

  	has_many :estacionamientoimagens, dependent: :destroy

  	has_many :estacionamientoservicios, dependent: :destroy
	has_many :serviciosadicionales, through: :estacionamientoservicios
end
