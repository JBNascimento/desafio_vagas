require 'rails_helper'

RSpec.describe Pessoa, type: :model do
    context "Entrada de dados de uma pessoa" do
        it "Pessoa é válido" do
            pessoa = Pessoa.new
            pessoa.nome = "User Test"
            pessoa.profissao = "Test Profissão"
            pessoa.localizacao = "A"
            pessoa.nivel = "5"

            expect(pessoa.valid?).to be_truthy
        end
    end

        it "Pessoa ser inválido com entradas vazias" do
            pessoa = Pessoa.new
            pessoa.nome = nil
            pessoa.profissao = nil
            pessoa.localizacao = nil
            pessoa.nivel = nil

            expect(pessoa.valid?).to be_falsey
        end

        it "Pessoa ser inválido com algumas entradas parcialmente vazias" do
            pessoa = Pessoa.new
            pessoa.nome = "Pessoa Nome"
            pessoa.profissao = nil
            pessoa.localizacao = "A"
            pessoa.nivel = nil

            expect(pessoa.valid?).to be_falsey
        end
end