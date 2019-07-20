class Candidatura < ApplicationRecord
  belongs_to :pessoa
  belongs_to :vaga

  alias_attribute :id_pessoa, :pessoa_id
  alias_attribute :id_vaga, :vaga_id
end
