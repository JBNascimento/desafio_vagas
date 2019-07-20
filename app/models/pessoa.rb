class Pessoa < ApplicationRecord
    has_many :candidaturas, dependent: :destroy
    validates :nome, presence: true
    validates :profissao, presence: true
    validates :localizacao, presence: true
    validates :nivel, presence: true
end
