class RemoveScoreFromPessoa < ActiveRecord::Migration[5.2]
  def change
    remove_column :pessoas, :score, :integer
  end
end
