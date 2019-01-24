Rails.application.routes.draw do
  get 'estacionamientos/edicion'
  get 'estacionamientos/lista'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'estacionamientos#edicion'
end
