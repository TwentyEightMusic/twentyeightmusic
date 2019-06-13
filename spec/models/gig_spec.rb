require "rails_helper"

describe Gig do
  context ".sorted_in_the_past" do
    it "returns a list of gigs from past to present" do
      yesterdays_gig = create(:gig, start_time: 1.day.ago)
      recent_gig = create(:gig, start_time: 5.days.ago)
      old_gig = create(:gig, start_time: 100.days.ago)

      expect(Gig.sorted_in_the_past).to eq([old_gig, recent_gig, yesterdays_gig])
    end
  end

  context ".upcoming_gigs" do
    context "when a number of gigs is given" do
      it "returns the given number of gigs" do
        8.times { create(:gig) }
        upcoming_gigs = Gig.upcoming_gigs(5)
        expect(upcoming_gigs.count).to eq 5
      end
    end

    context "when a number of gigs is not given" do
      it "returns the given number of gigs" do
        8.times { create(:gig) }
        upcoming_gigs = Gig.upcoming_gigs
        expect(upcoming_gigs.count).to eq 8
      end
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
