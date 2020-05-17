require 'rails_helper'

RSpec.describe "Attractions", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/attractions/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/attractions/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/attractions/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/attractions/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/attractions/show"
      expect(response).to have_http_status(:success)
    end
  end

end
