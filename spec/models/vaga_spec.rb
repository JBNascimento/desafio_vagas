require 'rails_helper'

RSpec.describe Vaga, type: :model do
    context "Entrada de dados de uma vaga" do
        it "Vaga é válido" do
            vaga = Vaga.new
            vaga.empresa = "Vaga Test"
            vaga.titulo = "Vaga Título"
            vaga.descricao = "Vaga Descrição"
            vaga.localizacao = "B"
            vaga.nivel = "6"

            expect(vaga.valid?).to be_truthy
        end
    end

        it "Vaga ser inválido com entradas vazias" do
            vaga = Vaga.new
            vaga.empresa = nil
            vaga.titulo = nil
            vaga.descricao = nil
            vaga.localizacao = nil
            vaga.nivel = nil

            expect(vaga.valid?).to be_falsey
        end

        it "Vaga ser inválido com algumas entradas parcialmente vazias" do
            vaga = Vaga.new
            vaga.empresa = "Empresa"
            vaga.titulo = nil
            vaga.descricao = nil
            vaga.localizacao = nil
            vaga.nivel = "5"

            expect(vaga.valid?).to be_falsey
        end
    
end
