class HomeController < ApplicationController
  include SessionsHelper
  def new
    @persona = Persona.new
  end

  def create
    @persona = Persona.new(persona_params)

    if @persona.save
      redirect_to :action => :home, :id => @persona.id
    else
      render "new"  
    end
  end

  def edit
    @persona = Persona.find(params[:id])
  end

  def update
    @persona = Persona.find(params[:id])

    #if @estacionamiento.update_attributes(params[estacionamiento_params])
    if @persona.update(persona_params)
      redirect_to :action => :home, :id => @persona.id
    else
      render 'edit'
    end
  end

  def destroy
    @persona = Persona.find(params[:id])
    @persona.destroy

    redirect_to :action => :index
  end

  def show
   # @estacionamiento = Estacionamiento.find(params[:id])
  end
  def index
  	if logged_in?
    	persona = Persona.find(session[:persona_id])
    	if persona.tipousuario
           render layout: "dueno"
      	else
           render layout: "cliente"
      	end
    end
  end
end
