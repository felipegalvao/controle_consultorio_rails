class AgendamentosController < ApplicationController
    before_action :get_pacientes, only: [:new, :edit]
    
    def get_pacientes
        @user = current_user
        @pacientes = @user.pacientes
    end
    
    def index
        @user = current_user
        @agendamentos = @user.agendamentos
    end
    
    def new
        @agendamento = Agendamento.new
    end
    
    def create
        @agendamento = Agendamento.new(agendamento_params)
        if @agendamento.save
            flash[:success] = "Agendamento criado!"
            redirect_to agendamentos_path
        else
            render 'new'
        end
    end
    
    def edit
        @agendamento = Agendamento.find(params[:agendamento_id]) 
    end
    
    def update
        @agendamento = Agendamento.find(params[:agendamento_id])
        if @agendamento.update_attributes(agendamento_params)
            flash[:success] = "Agendamento atualizado com sucesso."
            redirect_to agendamentos_path
        else
            render 'edit'
        end
    end
    
    private
        
        def agendamento_params
            params.require(:agendamento).permit(:paciente_id, :data, :horario, :confirmado)
        end
end