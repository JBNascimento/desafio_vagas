class CreateVagas < ActiveRecord::Migration[5.2]
  def change
    create_table :vagas do |t|
      t.string :empresa
      t.string :titulo
      t.string :descricao
      t.string :localizacao
      t.integer :nivel

      t.timestamps
    end
  end
end
