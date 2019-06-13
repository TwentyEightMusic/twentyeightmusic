require "rails_helper"

describe Api::V1::GigsController do
  context "#create" do
    it "creates a gig from a valid api key request" do
      api_key = build_stubbed(:api_key)
      gig_info = { venue: "The WoodShed", start_time: Time.now }

      expect(ApiKey).to receive(:find_by).and_return(api_key)
      post :create, params: { api_key: api_key, gig_info: gig_info }

      expect(Gig.all.count).to eq 1
    end
  end
end
