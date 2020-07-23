require "rails_helper"

show_tests_in_browser = true
do_not_show_tests_in_browser = false

feature "Devise:", js: do_not_show_tests_in_browser do

  scenario "sign-up form has username field", points: 1, hint: "This test requires the label for the field to be 'Username', and may not work if the corresponding label tag does not have a 'for' attribute." do
    visit "/users/sign_up"

    expect(page).to have_selector("label", text: "Username")
  end

  scenario "sign-up form username field works", points: 2, hint: "This test requires the label for the field to be 'Username', and may not work if the corresponding label tag does not have a 'for' attribute." do
    visit "/users/sign_up"
    fill_in "Email", :with => "alice@example.com"
    fill_in "Password", :with => "alicepassword"
    fill_in "Password confirmation", :with => "alicepassword"
    fill_in "Username", :with => "alice"
    click_on "Sign up"

    within("nav") {
      expect(page).to have_content("alice")
    }
  end

  scenario "edit form has username field", points: 1, hint: "This test requires the label for the field to be 'Username', and may not work if the corresponding label tag does not have a 'for' attribute." do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit "/users/edit"

    expect(page).to have_selector("label", text: "Username")
  end

  scenario "edit form username field works", points: 2, hint: "This test requires the label for the field to be 'Username', and may not work if the corresponding label tag does not have a 'for' attribute." do
    user = FactoryGirl.create(:user, :username => "robert")
    login_as(user, :scope => :user)

    visit "/users/edit"
    fill_in "Username", :with => "bob"
    fill_in "Current password", :with => user.password
    click_on "Update"

    within("nav") {
      expect(page).to have_content("bob")
    }
  end

  scenario "sign-in form modified with Bootstrap class", points: 1, hint: "The test only looks to see whether the class 'form-group' is present." do
    visit "/"

    expect(page).to have_selector(".form-group")
  end

end
