class PacientesController < ApplicationController
    before_action :get_paciente, only: [ :show, :edit, :update, :destroy ]
    
    def get_paciente
        @paciente = Paciente.find(params[:paciente_id])
    end
    
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
        @paciente = Paciente.new(paciente_params)
        @paciente.user_id = current_user.id
        if @paciente.save
            flash[:success] = "Paciente registrado com sucesso"
            redirect_to pacientes_path
        else
            render 'index'
        end
    end
    
    def show
        @atendimentos = @paciente.atendimentos
    end
    
    def edit
        
    end
    
    def update
        if @paciente.update_attributes(paciente_params)
            flash[:success] = "Informações do paciente atualizadas com sucesso."
            redirect_to @paciente
        else
            render 'edit'
        end
    end
    
    def destroy
        @paciente.destroy
    end
    
    private
    
        def paciente_params
            params.require(:paciente).permit(:nome, :sexo, :identidade, :cpf,
                :email, :telefone_fixo, :telefone_celular, :endereco, 
                :data_de_nascimento, :plano_de_saude, :numero_plano_de_saude)
        end
end