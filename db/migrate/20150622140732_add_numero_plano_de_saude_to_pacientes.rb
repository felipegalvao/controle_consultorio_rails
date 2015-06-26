class AddNumeroPlanoDeSaudeToPacientes < ActiveRecord::Migration
  def change
    add_column :pacientes, :numero_plano_de_saude, :string
  end
end
