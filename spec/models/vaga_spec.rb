require 'rails_helper'

RSpec.describe Vaga, type: :model do
    context "when user insert a data" do
        it "Vaga is valid" do
            vaga = Vaga.new
            vaga.empresa = "Vaga Test"
            vaga.titulo = "Vaga Título"
            vaga.descricao = "Vaga Descrição"
            vaga.localizacao = "B"
            vaga.nivel = "5"

            expect(vaga.valid?).to be_truthy
        end
    

        it "Vaga is invalid for nil entries" do
            vaga = Vaga.new
            vaga.empresa = nil
            vaga.titulo = nil
            vaga.descricao = nil
            vaga.localizacao = nil
            vaga.nivel = nil

            expect(vaga.valid?).to be_falsey
        end

        it "Vaga is invalid for some nil entries" do
            vaga = Vaga.new
            vaga.empresa = "Empresa"
            vaga.titulo = nil
            vaga.descricao = nil
            vaga.localizacao = nil
            vaga.nivel = "5"

            expect(vaga.valid?).to be_falsey
        end

        it "Vaga is invalid for localizacao diferent of A..E" do
            vaga = Vaga.new
            vaga.empresa = "Empresa"
            vaga.titulo = "Título"
            vaga.descricao = "Descrição"
            vaga.localizacao = "G"
            vaga.nivel = "5"

            expect(vaga.valid?).to be_falsey
        end

        it "is invalid for nivel diferent of 1..5" do
            vaga = Vaga.new
            vaga.empresa = "Empresa"
            vaga.titulo = "Título"
            vaga.descricao = "Descrição"
            vaga.localizacao = "A"
            vaga.nivel = "7"

            expect(vaga.valid?).to be_falsey
        end
    end
    
end
