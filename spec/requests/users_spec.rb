require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /my_portfolio" do
    it "returns http success" do
      get "/users/my_portfolio"
      expect(response).to have_http_status(:success)
    end
  end

end
