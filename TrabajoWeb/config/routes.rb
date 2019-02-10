Rails.application.routes.draw do
 
  get 'alquileres/lista'
  get 'alquileres/registro'
  get 'serviciosadicionales/estacedicion'
  get 'serviciosadicionales/estaclista'
  get 'estacionamientos/buscar'
  get 'estacionamientos/buscar_detalle'
  get 'estacionamientos/comentar'

  get'personas/bajausuario'
  post'personas/bajausuariopost'

  resources "personas"

 
  get 'home/login'
  
  get 'home/index' 

  get 'administrador/principal'
  
  resources "estacionamientos"
  resources "serviciosadicionales"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html  
  root 'home#index'
  resources "home"
  resources "publicidads"
end
