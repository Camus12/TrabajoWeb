class S2essionsController < ApplicationController
	layout 'socrates'
	include S2essionsHelper
	def new
  end

  def create
    administrator = Administrator.find_by(usuario: params[:session][:usuario].downcase, contrasena: params[:session][:contrasena])
    if administrator
      log_in administrator
       redirect_to :controller => :administrador, :action => :principal
    else
      # Si no existe
      flash[:danger] = 'Invalida la combinacion email/password'
      render 'new'
    end
  end

  def destroy
  	def destroy
  	l2og_out if l2ogged_in?
    redirect_to :root
  end
  end
end
