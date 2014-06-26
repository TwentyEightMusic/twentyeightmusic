require "rails_helper"

describe Gig do
  context ".upcoming_gigs" do
    it "returns the given number of gigs" do
      8.times { create(:gig) }
      number_of_gigs_requested = 5
      upcoming_gigs = Gig.upcoming_gigs(number_of_gigs_requested)
      p Gig.last.start_time
      p Gig.upcoming_gigs(5)
      expect(upcoming_gigs.count).to eq 5
    end
  end
end
