require "rails_helper"

feature "User visits home page" do
  scenario "and sees a list of upcoming gigs" do
    gig = create(:gig, venue: "The Woodshed")
    visit root_path
    expect(page).to have_content(gig.venue)
  end
end
