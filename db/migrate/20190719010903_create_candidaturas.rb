class CreateCandidaturas < ActiveRecord::Migration[5.2]
  def change
    create_table :candidaturas do |t|
      t.references :pessoa, foreign_key: true
      t.references :vaga, foreign_key: true

      t.timestamps
    end
  end
end
