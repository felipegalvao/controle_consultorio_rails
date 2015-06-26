class CreatePacientes < ActiveRecord::Migration
  def change
    create_table :pacientes do |t|
      t.string :nome
      t.string :identidade
      t.string :cpf
      t.date :data_de_nascimento
      t.string :plano_de_saude
      t.string :sexo
      t.string :endereco
      t.string :telefone_fixo
      t.string :telefone_celular
      t.string :email
      t.references :user, index: true

      t.timestamps
    end
  end
end
