class Candidatura < ApplicationRecord
  belongs_to :pessoa
  belongs_to :vaga
end
