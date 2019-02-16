class HomeController < ApplicationController
  include SessionsHelper
  
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
