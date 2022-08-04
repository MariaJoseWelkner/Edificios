class EdificiosController < ApplicationController
    before_action :set_edificio, only: %i[show edit update destroy]
    
    def index
        @edificios = Edificio.all.order(created_at: :desc)
    end
    def show
        
    end
    def new
        @edificio = Edificio.new    #con esto dejamos inicializada la instancia, cada vez que ingrese una variable building en el formulario lo va a crear como una nueva instancia
    end
    def edit

    end
    def create
        @edificio = Edificio.new(edificio_params)
        if @edificio.save 
            redirect_to edificios_path, notice: "Edificio creado exitosamente"
        else 
            render :new, status: :unprocessable_entity
        end
    end
    def update
        if @edificio.update(edificio_params)
            redirect_to @edificio, notice: "Edificio actualizado exitosamente"
        else 
            render :new, status: :unprocessable_entity
        end
    end
    def destroy
        @edificio = Edificio.find(params[:id])
        @edificio.destroy
        redirect_to edificios_url, notice: "Edificio Eliminado Exitosamente"
    end


    private 

    def set_edificio
        @edificio = Edificio.find(params[:id])
    end

    def edificio_params 
        params.require(:edificio).permit(:nombre, :direccion, :ciudad)
    end
end
