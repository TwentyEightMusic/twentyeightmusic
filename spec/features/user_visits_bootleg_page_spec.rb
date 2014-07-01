require "rails_helper"

feature "User visits bootleg page" do
  scenario "and sees a list of gig dates" do
    gig = create(:gig)
    bootleg = create(:bootleg, gig: gig)

    visit bootlegs_path

    expect(page).to have_content("Bar 1")
    expect(page).to have_content("Tue, Jul 1")
  end

  scenario "and sees a list of tracks for a certain gig" do
    gig = create(:gig)
    bootleg = create(:bootleg, gig: gig)
    track = create(:track, bootleg: bootleg, name: "Santeria", filepicker_url: "http://google.com")

    visit bootlegs_path

    expect(page).to have_link("Santeria", "http://google.com")
  end

  scenario "sees a link to add bootlegs" do
    gig_1 = create(:gig)
    gig_2 = create(:gig)
    user = create(:user, email: "kenyonj@gmail.com", password_digest: "12345")
    
    sign_in(user)

    visit bootlegs_path

    click_link "Add bootleg"

    expect(page).to have_content "Bar 1"
    expect(page).to have_content "Bar 2"
  end

  scenario "adds bootlegs to a specfic gig" do
    gig = create(:gig)
    user = create(:user)
    sign_in(user)

    visit bootlegs_path
    click_link "Add bootleg"
    click_button "Next..."

    expect(page).to have_content "Upload your bootleg"
  end
end
