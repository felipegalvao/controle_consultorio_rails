class AddHorarioEntradaToAtendimentos < ActiveRecord::Migration
  def change
    add_column :atendimentos, :horario_entrada, :time
  end
end
