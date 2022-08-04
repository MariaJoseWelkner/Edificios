class DepartamentosController < ApplicationController
    before_action :set_departamento, only: %i[ show edit update destroy ]
    before_action :consulta_edificios, only: %i[ show new edit update ]
    def index
        @departamentos = Departamento.includes(:edificio).order(created_at: :desc)
    end
    def show
        
    end
    def new
        @departamento = Departamento.new
    end
    def edit
    end
    def create
        @departamento = Departamento.new(departamento_params)
        if @departamento.save
            redirect_to departamentos_path, notice: "Departamento Creado Exitosamente."
        else
            redirect_to new_departamento_url, notice: "Departamento ya existe"
        end
    end
    def update
        if @departamento.update(departamento_params)
            redirect_to @departamento, notice: "Departamento actualizado Exitosamente."
        else
            render :edit, status: :unprocessable_entity
        end
    end
    def destroy
        @departamento.destroy
        redirect_to departamentos_url, notice: "Departamento Eliminado Exitosamente."
    end
    private
    def set_departamento
        @departamento = Departamento.find(params[:id])
    end
    def departamento_params
        params.require(:departamento).permit(:numero, :edificio_id)
    end
    def consulta_edificios
        @edificios = Edificio.select(:id, :nombre).order(nombre: :asc)
    end  
    

end
