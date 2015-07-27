class CreateFinanceiros < ActiveRecord::Migration
  def change
    create_table :financeiros do |t|
      t.string :descricao
      t.string :tipo
      t.string :categoria
      t.decimal :valor
      t.date :data
      t.text :observacao
      t.references :user, index: true

      t.timestamps
    end
  end
end
