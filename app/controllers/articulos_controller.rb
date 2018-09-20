class ArticulosController < ApplicationController
  http_basic_authenticate_with name: "nasugo", password: "JEPA", except: [:index, :show]
  def index
    @articulos = Articulo.all
  end
  def show
    # id le dice a rails que esta ruta espera un parametro :id, que en nuestro caso sera el id del articulo
    @articulo = Articulo.find(params[:id])
  end
#
  def new
    @articulo = Articulo.new
  end
#
  def edit
    @articulo = Articulo.find(params[:id])
  end
#
  def create
    #metodo del controlador los datos del form(articulos) como texto plano
    # params[]es un objeto que representa los parametros que vienen del formulario
    #render plain: params[:articulo].inspect

    @articulo = Articulo.new(articulo_params)
    #retorna un boolean indicando si fue o no creada
      if @articulo.save
        redirect_to @articulo
      else
        render 'new'
      end

  end
  #
  def update
    @articulo = Articulo.find(params[:id])
    #retorna un boolean indicando si fue o no creada
      if @articulo.update(articulo_params)
        redirect_to @articulo
      else
        render 'edit'
      end
  end
  #
  def destroy
    @articulo = Articulo.find(params[:id])
    @articulo.destroy
    redirect_to @articulo

  end

  private
    def articulo_params
      params.require(:articulo).permit(:title, :text)
    end
end
