module S2essionsHelper
	def log_in(administrator)
	session[:administrator_id] = administrator.id
    session[:administrator_usuario] = administrator.usuario
  end

  def current_administrator
    @current_administrator ||= Administrator.find_by(id: session[:administrator_id])
  end

  def l2ogged_in?
    !current_administrator.nil?
  end

  def l2og_out
    session.delete(:administrator_id)
    session.delete(:administrator_usuario)
    @current_administrator = nil
  end

end
