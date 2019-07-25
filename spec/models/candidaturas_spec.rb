require 'rails_helper'

RSpec.describe Candidatura, type: :model do
    context "Entrada de dados de uma candidatura" do
        it "Candidatura ser inválido com entradas vazias" do
            candidatura = Candidatura.new
            candidatura.pessoa_id = nil
            candidatura.vaga_id = nil

            expect(candidatura.valid?).to be_falsey
        end
    end    
end