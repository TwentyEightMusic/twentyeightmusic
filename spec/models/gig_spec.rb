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

  context "#listing_date" do
    it "returns the listing date" do
      time = DateTime.parse("May 23, 2015 10PM")
      gig = create(:gig, start_time: time, venue: "The Woodshed")

      expect(gig.listing_date).to eq "The Woodshed Sat, May 23"
    end
  end

  context "#date" do
    it "returns the date" do
      time = DateTime.parse("May 23, 2015 10PM")
      gig = create(:gig, start_time: time, venue: "The Woodshed")

      expect(gig.date).to eq "Sat, May 23 2015"
    end
  end
end
