Rails.application.routes.draw do
  get 'home/vista'
  get 'home/login'
  get 'home/registro'
  get 'home/bajausuario'
  get 'home/actualizaciondeusuario'
  get 'home/index' 
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
