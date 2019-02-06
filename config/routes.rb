Rails.application.routes.draw do
  resources :publicidads

  post 'publicidads/:id/edit'


  get 'alquileres/lista'
  get 'alquileres/registro'
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
  post 'publicidad/registro'
  get 'publicidad/index'
  post 'publicidad/edicion'
  post 'publicidad/eliminar'

  resources "estacionamientos"
  resources "serviciosadicionales"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html  
  root 'home#index'
  resources "home"

end
