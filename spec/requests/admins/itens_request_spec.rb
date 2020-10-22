require 'rails_helper'

RSpec.describe "Admins::Itens", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/admins/itens/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/admins/itens/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/admins/itens/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/admins/itens/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
