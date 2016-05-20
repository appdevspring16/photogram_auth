require "rails_helper"

show_tests_in_browser = true
do_not_show_tests_in_browser = false

feature "Users:", js: do_not_show_tests_in_browser do

  scenario "for new photo form, user ID prepopulated or in hidden field", points: 2 do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit "/photos/new"

    if page.has_selector?("label", text: "User")
      expect(page).to have_selector("input[value='#{user.id}']")
      expect(page).to have_field('User', with: "#{user.id}")
    else
      expect(page).not_to have_selector("label", text: "User")
    end
  end

  scenario "RCAV set for /users", points: 1 do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit "/users"

    expect(page.status_code).to be(200) # 200 is "OK"
  end

  scenario "/users lists all users", points: 2 do
    user_1 = FactoryGirl.create(:user, :username => "1", :email => "1@m.com")
    user_2 = FactoryGirl.create(:user, :username => "2", :email => "2@m.com")
    login_as(user_1, :scope => :user)

    visit "/users"

    expect(page).to have_content(user_1.username)
    expect(page).to have_content(user_2.username)
  end

  scenario "header includes link to /users", points: 1 do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit "/"

    within("nav") {
      expect(page).to have_link(nil, href: "/users")
    }
  end

  scenario "RCAV set for /users/:id", points: 1 do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit "/users/#{user.id}"

    expect(page.status_code).to be(200) # 200 is "OK"
  end

  scenario "/users/:id lists user's details", points: 1 do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit "/users/#{user.id}"

    expect(page).to have_content(user.username)
  end

  scenario "/users/:id lists user's photos", points: 2 do
    user = FactoryGirl.create(:user)
    photo_1 = FactoryGirl.create(:photo, :user_id => user.id)
    photo_2 = FactoryGirl.create(:photo, :user_id => user.id)
    login_as(user, :scope => :user)

    visit "/users/#{user.id}"

    expect(page).to have_content(photo_1.caption)
    expect(page).to have_css("img[src*='#{photo_1.image}']")
    expect(page).to have_content(photo_2.caption)
    expect(page).to have_css("img[src*='#{photo_2.image}']")
  end

  scenario "when signed in header has link to /users/:id", points: 2 do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit "/"

    within("nav") {
      expect(page).to have_link(nil, href: "/users/#{user.id}")
    }
  end

  scenario "unless signed in, no link to /users/:id", points: 1 do
    user = FactoryGirl.create(:user)

    visit "/"

    within("nav") {
      expect(page).not_to have_link(nil, href: "/users/#{user.id}")
    }
  end

  scenario "in routes.rb, /users/:id below 'devise_for :users'", points: 1 do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit "/users/sign_in"

    expect(page.current_path).to eq "/"
  end

end
