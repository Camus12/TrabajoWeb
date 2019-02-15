module AdministratorsHelper
	def log_in(administrator)
    s2ession[:administrator_id] = administrator.id
    s2ession[:administrator_usuario] = administrator.usuario
  end

  def current_user
    @current_administrator ||= Administrator.find_by(id: s2ession[:administrator_id])
  end

  def logged_in?
    !current_administrator.nil?
  end

  def log_out
    s2ession.delete(:administrator_id)
    s2ession.delete(:administrator_usuario)
    @current_administrator = nil
  end
end
