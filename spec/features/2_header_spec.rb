require "rails_helper"

show_tests_in_browser = true
do_not_show_tests_in_browser = false

feature "Header:", js: do_not_show_tests_in_browser do

  scenario "edit profile link is just username", points: 2 do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit "/"

    within("nav") {
      expect(page).to have_link(user.username, href: "/users/edit")
    }
  end

  scenario "no 'dummy' text in sign-out link", points: 1 do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit "/"

    within("nav") {
      expect(page).to have_link(nil, href: "/users/sign_out")
      expect(page).not_to have_link("Dummy Sign Out Link")
    }
  end

  scenario "if logged out, sign-up/sign-in instead of sign-out/edit", points: 2 do
    visit "/"

    within("nav") {
      expect(page).not_to have_link(nil, href: "/users/sign_out")
      expect(page).not_to have_link(nil, href: "/users/edit")
      expect(page).to have_link(nil, href: "/users/sign_up")
      expect(page).to have_link(nil, href: "/users/sign_in")
    }
  end

end
