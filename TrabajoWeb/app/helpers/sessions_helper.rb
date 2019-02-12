module SessionsHelper
	def log_in(persona)
    session[:persona_id] = persona.id
    session[:persona_correo] = persona.correo
  end

  def current_persona
    @current_persona ||= Persona.find_by(id: session[:persona_id])
  end

  def logged_in?
    !current_persona.nil?
  end

  def log_out
    session.delete(:persona_id)
    session.delete(:persona_correo)
    @current_persona = nil
  end

end
