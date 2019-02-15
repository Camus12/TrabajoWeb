class ServiciosadicionalesController < ApplicationController
  layout 'dueno'
  
  def new
    @servicioadicional = Serviciosadicionale.new
  end

  def create
    @servicioadicional = Serviciosadicionale.new(servicioadicional_params)
    @servicioadicional.codigopersona = session[:persona_id]

    if @servicioadicional.save
      redirect_to :action => :show, :id => @servicioadicional.id
    else
      render "new"
    end
  end

  def edit
    @servicioadicional = Serviciosadicionale.find(params[:id])
  end

  def update
    @servicioadicional = Serviciosadicionale.find(params[:id])
    @servicioadicional.codigopersona = session[:persona_id]

    if @servicioadicional.update(servicioadicional_params)
      redirect_to :action => :show, :id => @servicioadicional.id
    else
      render 'edit'
    end
  end

  def destroy
    @servicioadicional = Serviciosadicionale.find(params[:id])
    @servicioadicional.destroy

    redirect_to :action => :index
  end

  def show
    @servicioadicional = Serviciosadicionale.find(params[:id])
  end

  def index
    @serviciosadicionales = Serviciosadicionale.all.where("codigopersona = " + session[:persona_id].to_s)
  end

  def estaclista
    @estacionamiento = Estacionamiento.find(params[:id])
  end

  def estacedicion
  end

private
  def servicioadicional_params
    params.require(:serviciosadicionale).permit(:codigopersona, :tiposervicio, :descripcion)
  end
end
