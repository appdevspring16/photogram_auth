require "rails_helper"

show_tests_in_browser = true
do_not_show_tests_in_browser = false

feature "Devise:", js: do_not_show_tests_in_browser do

  scenario "root url set to photos index", points: 1 do
    user = FactoryGirl.create(:user)

    visit "/"
    if page.has_selector?("label", text: "Email")
      fill_in "Email", :with => user.email
      fill_in "Password", :with => user.password
      click_on "Log in"
    end

    expect(page).to have_link(nil, href: "/photos/new")
  end

  scenario "user authentication required for home page", points: 2 do
    visit "/"

    expect(page).to have_selector("form", count: 1)
    expect(page).to have_selector("label", text: "Email")
    expect(page).to have_selector("label", text: "Password")
    expect(page).to have_selector("input[type=submit][value='Log in']")
    expect(page).not_to have_link(nil, href: "/photos/new")
  end

  scenario "user authentication required for likes page", points: 1 do
    visit "/likes"

    expect(page).to have_selector("form", count: 1)
    expect(page).to have_selector("label", text: "Email")
    expect(page).to have_selector("label", text: "Password")
    expect(page).to have_selector("input[type=submit][value='Log in']")
    expect(page).not_to have_selector("h1", text: "Likes")
    expect(page).not_to have_link("New Like")
  end

  scenario "login form works", points: 1 do
    user = FactoryGirl.create(:user)

    visit "/"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on "Log in"

    expect(page).to have_content("Signed in successfully.")
  end

end
