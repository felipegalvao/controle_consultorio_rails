class CreateAgendamentos < ActiveRecord::Migration
  def change
    create_table :agendamentos do |t|
      t.date :data
      t.time :horario
      t.boolean :confirmado
      t.references :paciente, index: true

      t.timestamps
    end
  end
end
