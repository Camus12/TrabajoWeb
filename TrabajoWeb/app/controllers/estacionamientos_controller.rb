class EstacionamientosController < ApplicationController
  layout 'dueno', except: [:buscar, :buscar_detalle]
	#layout 'cliente', except: [:edicion, :lista]

  def edicion
  end

  def lista
  end

  def buscar
    render layout: "cliente"
  end

  def buscar_detalle
    render layout: "cliente"
  end
end
