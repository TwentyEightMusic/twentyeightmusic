require "rails_helper"

describe Api::V1::GigsController do
  context "#create" do
    it "creates a gig from a valid api key request" do
      api_key = create(:api_key)
      gig_info = { venue: "The WoodShed", start_time: Time.now }

      ApiKey.stub(:find_by) { api_key }
      get :create, api_key: api_key, gig_info: gig_info

      expect(Gig.all.count).to eq 1
    end
  end
end
