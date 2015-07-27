class FinanceirosController < ApplicationController
    before_action :get_financeiro, only: [ :edit, :update, :destroy ]
    
    def get_financeiro
        @financeiro = Financeiro.find(params[:financeiro_id])
    end
    
    def index
        @user = current_user
        @financeiro = Financeiro.new
        
        if params[:data_de] && params[:data_ate]
            data_de = params[:data_de]
            data_ate = params[:data_ate]
            @financeiros = @user.financeiros.where("financeiros.data >= ? AND financeiros.data <= ?", data_de, data_ate)
            soma_receitas = @user.soma_receitas(data_de, data_ate)
            soma_despesas = @user.soma_despesas(data_de, data_ate)
        else
            @financeiros = @user.financeiros
            soma_receitas = @user.soma_receitas
            soma_despesas = @user.soma_despesas
        end
        @resultado =  soma_receitas - soma_despesas
    end
    
    def new
        @financeiro = Financeiro.new
    end
    
    def create
        @user = current_user
        @financeiros = @user.financeiros
        @financeiro = Financeiro.new(financeiro_params)
        @financeiro.user_id = current_user.id
        if @financeiro.save
            flash[:success] = "Receita / despesa registrada com sucesso"
            redirect_to financeiros_path
        else
            render 'index'
        end
    end
    
    def edit
        
    end
    
    def update
        if @financeiro.update_attributes(financeiro_params)
            flash[:success] = "Despesa / receita atualizada com sucesso."
            redirect_to financeiros_path
        else
            render 'edit'
        end
    end
    
    def destroy
        @financeiro.destroy
        flash[:success] = "Despesa / Receita apagada com sucesso"
        redirect_to financeiros_path
    end
    
    private
        
        def financeiro_params
            params.require(:financeiro).permit(:descricao, :tipo, :categoria,
                :valor, :data, :observacao)
        end
end
