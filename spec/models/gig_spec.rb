require "rails_helper"

describe Gig do
  context ".upcoming" do
    it "returns the given number of gigs" do
      8.times { create(:gig) }
      upcoming_gigs = Gig.upcoming_gigs(5)

      expect(upcoming_gigs.count).to eq 5
    end
  end
end
