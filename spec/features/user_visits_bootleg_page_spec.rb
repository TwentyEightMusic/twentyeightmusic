require "rails_helper"

feature "User visits bootleg page" do
  xscenario "and sees a list of gig dates" do
    gig = create(:gig, start_time: DateTime.parse("July 1"))
    create(:bootleg, gig: gig)

    visit bootlegs_path

    require 'pry'; binding.pry
    expect(page).to have_content("Bar 1")
    expect(page).to have_content("Tue, Jul 1")
  end

  scenario "and sees a list of tracks for a certain gig" do
    gig = create(:gig)
    bootleg = create(:bootleg, gig: gig)
    create(:track, bootleg: bootleg, name: "Santeria", filepicker_url: "http://google.com")

    visit bootlegs_path

    expect(page).to have_link("Santeria", href: "http://google.com")
  end

  scenario "sees a link to add bootlegs" do
    create(:gig, :past, venue: "Bar 1")
    create(:gig, :past, venue: "Bar 2")
    user = create(:user, email: "kenyonj@gmail.com", password_digest: "12345")
    
    sign_in(user)

    visit bootlegs_path

    click_link "Add gig bootleg"

    expect(page).to have_content "Bar 1"
    expect(page).to have_content "Bar 2"
  end

  scenario "adds bootlegs to a specfic gig" do
    create(:gig, :past)
    user = create(:user)
    sign_in(user)

    visit bootlegs_path
    click_link "Add gig bootleg"
    click_button "Next..."

    expect(page).to have_button "Add bootleg"
  end
end
