class HomeController < ApplicationController



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
    
    #if params[:estacionamiento] != nil then
     # @estacionamientos = Estacionamiento.find_by_sql(["SELECT * FROM estacionamientos WHERE distrito LIKE ? AND tipo LIKE ? AND ubicacion LIKE ?", params[:estacionamiento][:distrito], params[:estacionamiento][:tipo], params[:estacionamiento][:ubicacion]])
    #else
   #   @estacionamientos = Estacionamiento.all

      ##Sirve para obtener los primeros N registros
      #@estacionamientos = Estacionamiento.take(0)
    #end
    
  end

  


private
  def persona_params
    params.require(:persona).permit(:codigopersona, :nombre, :apepaterno, :apematerno, :sexo, :tipodocumento, :numerodocumento, :tipousuario, :correo, :contraseña, :fechanacimiento, :numerocel, :distrito, :direccion)
  end

end
