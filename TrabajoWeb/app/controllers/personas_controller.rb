class PersonasController < ApplicationController
 


  def index
     @personas = Persona.all
  end

  def new
      @persona = Persona.new
  end


  def create
    @persona = Persona.new(persona_params)

    if @persona.save
      redirect_to :action => :index, :id => @persona.id
    else
      render "new"  
    end
  end


  def show
  end

  def edit
    @persona = Persona.find(params[:id])
  end

  def update
    @persona = Persona.find(params[:id])

    #if @estacionamiento.update_attributes(params[estacionamiento_params])
    if @persona.update(persona_params)
      redirect_to :action => :show, :id => @persona.id
    else
      render 'edit'
    end
  end

   def bajausuariopost
    #puts params[:DarmeBaja][:id]
    puts @personabaja
    @persona = Persona.find(@personabaja)
    @persona.destroy

    redirect_to :action => :index
   end


  def bajausuario
     @persona = Persona.find(params[:id])
      @personabaja = params[:id]
      puts @personabaja
  end

  
  private
  def persona_params
    params.require(:persona).permit(:codigopersona, :nombre, :apepaterno, :apematerno, :sexo, :tipodocumento, :numerodocumento, :tipousuario, :correo, :contraseña, :fechanacimiento, :numerocel, :distrito, :direccion)
  end


end
