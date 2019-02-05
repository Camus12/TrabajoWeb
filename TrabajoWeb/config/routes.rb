Rails.application.routes.draw do
  get 'alquileres/lista'
  get 'alquileres/registro'
  get 'serviciosadicionales/edicion'
  get 'serviciosadicionales/lista'
  get 'serviciosadicionales/estacedicion'
  get 'serviciosadicionales/estaclista'
  get 'estacionamientos/buscar'
  get 'estacionamientos/buscar_detalle'
  get 'estacionamientos/comentar'
  get 'home/vista'
  get 'home/login'
  get 'home/registro'
  get 'home/bajausuario'
  get 'home/actualizaciondeusuario'
  get 'home/index' 

  get 'administrador/principal'
  get 'publicidad/registro'
  get 'publicidad/lista'
  get 'publicidad/edicion'
  get 'publicidad/eliminar'

  resources "estacionamientos"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html  
  root 'home#index'
  resources "home"
end
