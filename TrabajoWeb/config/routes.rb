Rails.application.routes.draw do 
  get 'sessions/new'

  get 'alquileres/lista'
  get 'alquileres/registro'
  get 'alquileres/save_alquiler'
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
  get 'administrador/loginadm'
  
  resources "estacionamientos"
  resources "serviciosadicionales"

  #############
  get    'signup'  => 'personas#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  #############
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html  
  root 'home#index'
  resources "home"
  resources "publicidads"
end
