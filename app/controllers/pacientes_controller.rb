class PacientesController < ApplicationController
    
    def index
        @user = current_user
        @paciente = Paciente.new
        @pacientes = @user.pacientes
    end
    
    def new
        @paciente = Paciente.new
    end
    
    def create
        @user = current_user
        @pacientes = @user.pacientes
        @paciente = Paciente.new(paciente_params)
        @paciente.user_id = current_user.id
        if @paciente.save
            flash[:success] = "Paciente registrado com sucesso"
            redirect_to '/dashboard/pacientes'
        else
            render 'index'
        end
    end
    
    def show
        @paciente = Paciente.find(params[:id])
    end
    
    private
    
        def paciente_params
            params.require(:paciente).permit(:nome, :sexo, :identidade, :cpf,
                :email, :telefone_fixo, :telefone_celular, :endereco, 
                :data_de_nascimento, :plano_de_saude, :numero_plano_de_saude)
        end
end