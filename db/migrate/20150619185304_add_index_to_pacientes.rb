class AddIndexToPacientes < ActiveRecord::Migration
  def change
    add_index :pacientes, :nome
    add_index :pacientes, :identidade
    add_index :pacientes, :cpf
    add_index :pacientes, :plano_de_saude
    add_index :pacientes, :email
  end
end
