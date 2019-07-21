class Vaga < ApplicationRecord
    has_many :candidaturas, dependent: :destroy

    validates :empresa, presence: true
    validates :titulo, presence: true
    validates :descricao, presence: true
    validates :localizacao, presence: true
    validates :nivel, presence: true
end
