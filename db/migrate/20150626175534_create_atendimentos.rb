class CreateAtendimentos < ActiveRecord::Migration
  def change
    create_table :atendimentos do |t|
      t.text :observacoes
      t.date :dia_agendado
      t.time :horario_agendado
      t.time :horario_chegada
      t.time :horario_saida
      t.boolean :consulta_cancelada
      t.string :exame_procedimento
      t.string :plano_de_saude
      t.references :paciente, index: true

      t.timestamps
    end
  end
end
