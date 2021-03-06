require "rails_helper"

RSpec.describe ::V1::PessoasController, :type => :controller do
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


  context 'when pessoa exists' do
    it 'return status code 200' do
      pessoa = FactoryBot.create(:pessoa)
      pessoa_attributes = attributes_for(:pessoa)
      put :create, params: pessoa_attributes,  :format => :json
      expect(response.status).to be(200)
    end
  end

end


