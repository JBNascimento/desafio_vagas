require "rails_helper"

RSpec.describe ::V1::CandidaturasController, :type => :controller do
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
end


