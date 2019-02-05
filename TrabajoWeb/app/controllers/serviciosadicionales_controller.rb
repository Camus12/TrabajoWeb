class ServiciosadicionalesController < ApplicationController
  layout 'dueno'
  
  def new
    @servicioadicional = Serviciosadicionale.new
  end

  def create
    @servicioadicional = Serviciosadicionale.new(servicioadicional_params)

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
    @serviciosadicionales = Serviciosadicionale.all
  end

  def estacedicion
  end

  def estaclista
  end

private
  def servicioadicional_params
    params.require(:serviciosadicionale).permit(:tiposervicio, :descripcion)
  end
end
