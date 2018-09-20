Rails.application.routes.draw do

  resources:articulos do
    resources:comentarios
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Esta ruta dirige la pagina principal al index que se creo

  root 'bienvenido#index'


end
