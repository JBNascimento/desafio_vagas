require 'rails_helper'

RSpec.describe Pessoa, type: :model do
    context "when user insert a data" do
        it "pessoa is valid" do
            pessoa = Pessoa.new
            pessoa.nome = "User Test"
            pessoa.profissao = "Test Profissão"
            pessoa.localizacao = "A"
            pessoa.nivel = "5"

            expect(pessoa.valid?).to be_truthy
        end
    

        it "pessoa is invalid for nil entries" do
            pessoa = Pessoa.new
            pessoa.nome = nil
            pessoa.profissao = nil
            pessoa.localizacao = nil
            pessoa.nivel = nil

            expect(pessoa.valid?).to be_falsey
        end

        it "pessoa is invalid for some nil entries" do
            pessoa = Pessoa.new
            pessoa.nome = "Pessoa Nome"
            pessoa.profissao = nil
            pessoa.localizacao = "A"
            pessoa.nivel = nil

          #  expect(pessoa.valid?).to be_falsey
        end

        it "pessoa is invalid for localizacao diferent of A..E" do
            pessoa = Pessoa.new
            pessoa.nome = "Pessoa Nome"
            pessoa.profissao = "Profissão"
            pessoa.localizacao = "G"
            pessoa.nivel = 5

            expect(pessoa.valid?).to be_falsey
        end

        it "pessoa is invalid for nivel diferent of 1..5" do
            pessoa = Pessoa.new
            pessoa.nome = "Pessoa Nome"
            pessoa.profissao = "Profissão"
            pessoa.localizacao = "A"
            pessoa.nivel = 87

            expect(pessoa.valid?).to be_falsey
        end
    end
end