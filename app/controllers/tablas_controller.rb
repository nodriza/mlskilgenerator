class TablasController < ApplicationController
  before_action :set_tabla, only: [:destroy]
  before_action :set_template, only: [:destroy]
  before_action :authenticate_template!

  def new
  end

  def create
  	@tabla = Tabla.new(tabla_params)
    if @tabla.save
      redirect_to @tabla.template, notice: "Se guardo en la lista"
    else
      redirect_to @template, notice: "No se subio nada"
    end
  end

  def destroy
  	@tabla.destroy
    redirect_to @template
  end

  private
  	def authenticate_template!
      if params.has_key? :tabla
        @template = Template.find(params[:tabla][:template_id])
      end
      if @template.nil?
        redirect_to root_path, notice: "no puedes editar un templateo ageno"
        return
      end
    end
    def tabla_params
      params.require(:tabla).permit(:template_id, :clave, :valor)
    end
    def set_tabla
      @tabla = Tabla.find(params[:id])
    end
    def set_template
      @template = @tabla.template
    end
end
