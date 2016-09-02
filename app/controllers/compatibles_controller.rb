class CompatiblesController < ApplicationController
  before_action :set_compatible, only: [:destroy]
  before_action :set_template, only: [:destroy]
  before_action :authenticate_template!

  def new
  end

  def create
  	@compatible = Compatible.new(compatible_params)
    if @compatible.save
      redirect_to @compatible.template, notice: "Se guardo en la lista"
    else
      redirect_to @template, notice: "No se subio nada"
    end
  end

  def destroy
  	@compatible.destroy
    redirect_to @template
  end

  private
  	def authenticate_template!
      if params.has_key? :compatible
        @template = Template.find(params[:compatible][:template_id])
      end
      if @template.nil?
        redirect_to root_path, notice: "no puedes editar un templateo ageno"
        return
      end
    end
    def compatible_params
      params.require(:compatible).permit(:template_id, :list)
    end
    def set_compatible
      @compatible = Compatible.find(params[:id])
    end
    def set_template
      @template = @compatible.template
    end
end
