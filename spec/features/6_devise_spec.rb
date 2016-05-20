require "rails_helper"

show_tests_in_browser = true
do_not_show_tests_in_browser = false

feature "Devise:", js: do_not_show_tests_in_browser do

  scenario "sign-up form has username field", points: 1, hint: "This test requires the label for the field to be 'Username', and may not work if the corresponding label tag does not have a 'for' attribute." do
    visit "/users/sign_up"

    expect(page).to have_selector("label", text: "Username")
  end

  scenario "sign-up form username field works", points: 2, hint: "This test requires the label for the field to be 'Username', and may not work if the corresponding label tag does not have a 'for' attribute." do
    sample_email = "alice@example.com"
    sample_password = "alicepassword"
    sample_username = "alice"

    visit "/users/sign_up"
    fill_in("Email", :with => sample_email)
    fill_in("Password", :with => sample_password)
    fill_in("Password confirmation", :with => sample_password)
    fill_in("Username", :with => sample_username)
    click_on("Sign up")

    within("nav") {
      expect(page).to have_content(sample_username)
    }
  end

  scenario "edit form has username field", points: 1, hint: "This test requires the label for the field to be 'Username', and may not work if the corresponding label tag does not have a 'for' attribute." do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit "/users/edit"

    expect(page).to have_selector("label", text: "Username")
  end

  scenario "edit form username field works", points: 2, hint: "This test requires the label for the field to be 'Username', and may not work if the corresponding label tag does not have a 'for' attribute." do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    new_username = "User-#{Time.now.to_f}"

    visit "/users/edit"
    fill_in("Username", :with => new_username)
    fill_in("Current password", :with => user.password)
    click_on("Update")

    within("nav") {
      expect(page).to have_content(new_username)
    }
  end

  scenario "sign-in form modified with Bootstrap class", points: 1, hint: "The test only looks to see whether the class 'form-group' is present." do
    visit "/"

    expect(page).to have_selector(".form-group")
  end

end
