module ApplicationHelper
  
  #Desde APPLICATION HELPER podremos acceder a estos helpers desde cualquier parte de la aplicación
  def logo
    image_tag("logo.png", :alt => "Fisior", :class => "round")
  end
  def logousabi
    image_tag("logousabismall.png", :alt => "Usabi, tu socio tecnologico")
  end
  def informes
    image_tag("menu/informes.png", :alt => "Seccion de informes")
  end
  def facturacion
    image_tag("menu/facturacion.png", :alt => "Facturacion")
  end
  def pacientes
    image_tag("menu/pacientes.png", :alt => "Ficha del paciente")
  end
  def citas
    image_tag("menu/citas.png", :alt => "Gestion de citas")
  end
  
  def fulltitle
    base_title = "FisioApp, Fisioterapia Fisior Las palmas"
    if @title.nil?
      base_title
    else
      "#{base_title}|#{@title}"
    end
  end
  
  def toDate(date_text)
    if !date_text.blank?
      date_text = date_text
    end
  end
end
