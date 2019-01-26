Rails.application.routes.draw do
  get 'alquileres/lista'
  get 'serviciosadicionales/edicion'
  get 'serviciosadicionales/lista'
  get 'serviciosadicionales/estacedicion'
  get 'serviciosadicionales/estaclista'
  get 'estacionamientos/edicion'
  get 'estacionamientos/lista'
  get 'home/vista'
  get 'home/login'
  get 'home/registro'
  get 'home/bajausuario'
  get 'home/actualizaciondeusuario'
  get 'home/index' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html  
  root 'home#index'
end
