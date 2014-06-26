require "rails_helper"

feature "User visits home page" do
  scenario "and sees a list of upcoming gigs" do
    gig = create(:gig, venue: "The Woodshed")

    visit root_path

    expect(page).to have_content(gig.venue)
  end

  scenario "and sees contact information" do
    email_address = "info@twentyeightmusic.com"

    visit root_path

    expect(page).to have_content(email_address)
  end

  scenario "and sees a link to the bandcamp page" do
    bandcamp_url = "http://music.twentyeightmusic.com"
    link_title = "music.twentyeightmusic.com"

    visit root_path

    expect(page).to have_link(link_title, href: bandcamp_url)
  end
end
