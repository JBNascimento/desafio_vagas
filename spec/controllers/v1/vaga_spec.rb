require "rails_helper"

RSpec.describe ::V1::VagasController, :type => :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)      
    end

    it "check for a JSON response" do
      get :index, format: :json
      expect(response).to be_successful
    end
  end


  context 'when vaga exists' do
    it 'return status code 200' do
      vaga = FactoryBot.create(:vaga)
      vaga_attributes = attributes_for(:vaga)
      put :create, params: vaga_attributes,  :format => :json
      expect(response.status).to be(200)
    end
  end

end
