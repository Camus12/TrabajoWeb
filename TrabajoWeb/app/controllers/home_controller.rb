class HomeController < ApplicationController
  def vista
    @persona = Persona.find(params[:id])
  end

  def login
  end

  def registro
    @persona = Persona.new
  end


  def create
    @persona = Persona.new(persona_params)

    if @persona.save
      redirect_to :action => :index, :id => @persona.codigopersona
    else
      render "registro"
    end
  end

  def bajausuario
    session[:misesion] = "Miguel Ortega"
  end

  def actualizaciondeusuario
    @persona = Persona.find(params[:id])
  end

  def index
    session[:persona_id] = 1
  end

private
  def persona_params
    params.require(:persona).permit(:codigopersona, :nombre, :apepaterno, :apematerno, :sexo, :tipodocumento, :numerodocumento, :tipousuario, :correo, :contraseña, :fechanacimiento, :numerocel, :distrito, :direccion)
  end

end
