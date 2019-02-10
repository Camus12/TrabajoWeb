class SessionsController < ApplicationController
  include SessionsHelper
 def new
  end

  def create
    persona = Persona.find_by(correo: params[:session][:correo].downcase, contraseña: params[:session][:contraseña])
    if persona
      log_in persona
      if persona.tipousuario == 1
           redirect_to :controller => :estacionamientos, :action => :index
      else
          redirect_to :controller => :estacionamientos, :action => :buscar
      end
      # Si existe
    else
      # Si no existe
      flash[:danger] = 'Invalida la combinacion email/password'
      render 'new'
    end
  end

  def destroy
  	log_out if logged_in?
    redirect_to :root
  end

end
