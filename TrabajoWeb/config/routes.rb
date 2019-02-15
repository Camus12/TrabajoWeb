Rails.application.routes.draw do 
  resources :administrators
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
  
  #resources "estacionamientos"
  resources :estacionamientos do
    resources :estacionamientoimagens
    resources :estacionamientoservicios
  end

  resources "serviciosadicionales"

  #############
  get    'signup'  => 'personas#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  #############
  resources :administrators
  get    'secreto'  => 'administrators#new'
  get    'socrates'   => 's2essions#new'
  post   'socrates'   => 's2essions#create'
  delete 'l2ogout'  => 's2essions#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html  
  root 'home#index'
  resources "home"
  resources "publicidads"
end
