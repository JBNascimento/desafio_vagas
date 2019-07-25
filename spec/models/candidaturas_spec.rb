require 'rails_helper'

RSpec.describe Candidatura, type: :model do
    context "when user insert a data" do
        it "candidatura is invalid for nil entries" do
            candidatura = Candidatura.new
            candidatura.pessoa_id = nil
            candidatura.vaga_id = nil

            expect(candidatura.valid?).to be_falsey
        end
    end    
end