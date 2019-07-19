class CreatePessoas < ActiveRecord::Migration[5.2]
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.string :profissao
      t.string :localizacao
      t.integer :nivel
      t.integer :score

      t.timestamps
    end
  end
end
