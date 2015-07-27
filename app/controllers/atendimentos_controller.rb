class AtendimentosController < ApplicationController
    before_action :get_paciente
    
    def get_paciente
        @paciente = Paciente.find(params[:paciente_id])
    end
    
    def new
        @atendimento = Atendimento.new
    end
    
    def create
        @atendimento = Atendimento.new(atendimento_params)
        @atendimento.paciente_id = @paciente.id
        if @atendimento.save
            flash[:success] = "Atendimento registrado com sucesso"
            redirect_to @paciente
        else
            render 'new'
        end
    end
    
    def show
        @atendimento = Atendimento.find(params[:atendimento_id])
    end
    
    def edit
        @atendimento = Atendimento.find(params[:atendimento_id])
    end
    
    def update
        @atendimento = Atendimento.find(params[:atendimento_id])
        if @atendimento.update_attributes(atendimento_params)
            flash[:success] = "Atendimento atualizado com sucesso."
            redirect_to @paciente
        else
            render 'edit'
        end
    end
    
    private
    
        def atendimento_params
            params.require(:atendimento).permit(:observacoes, :dia_agendado, 
                :horario_agendado, :horario_chegada, :horario_entrada, :horario_saida, 
                :consulta_cancelada, :exame_procedimento, :plano_de_saude)
        end
    
end
