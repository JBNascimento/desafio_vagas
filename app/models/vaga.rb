class Vaga < ApplicationRecord
    has_many :candidaturas, dependent: :destroy

    validates :empresa, presence: true
    validates :titulo, presence: true
    validates :descricao, presence: true
    validates :localizacao, presence: true
    validates :nivel, presence: true
    validates_format_of :localizacao, :with => /[A-E]/i, :message => "A localização da vaga deve ser um dos seguintes valores: A,B,C,D ou E"
    validates_inclusion_of :nivel, :in => 1..5, :message => "O nível da vaga deve ser um dos seguintes valores: 1,2,3,4 ou 5"
end
