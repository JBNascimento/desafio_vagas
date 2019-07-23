class AddScoreToCandidatura < ActiveRecord::Migration[5.2]
  def change
    add_column :candidaturas, :score, :integer
  end
end
