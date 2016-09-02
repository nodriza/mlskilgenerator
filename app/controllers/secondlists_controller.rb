class SecondlistsController < ApplicationController
  before_action :set_secondlist, only: [:destroy]
  before_action :set_template, only: [:destroy]
  before_action :authenticate_template!

  def new
  end

  def create
  	@secondlist = Secondlist.new(secondlist_params)
    if @secondlist.save
      redirect_to @secondlist.template, notice: "Se guardo en la lista"
    else
      redirect_to @template, notice: "No se subio nada"
    end
  end

  def destroy
  	@secondlist.destroy
    redirect_to @template
  end

  private
  	def authenticate_template!
      if params.has_key? :secondlist
        @template = Template.find(params[:secondlist][:template_id])
      end
      if @template.nil?
        redirect_to root_path, notice: "no puedes editar un templateo ageno"
        return
      end
    end
    def secondlist_params
      params.require(:secondlist).permit(:template_id, :list, :titulo)
    end
    def set_secondlist
      @secondlist = Secondlist.find(params[:id])
    end
    def set_template
      @template = @secondlist.template
    end
end
