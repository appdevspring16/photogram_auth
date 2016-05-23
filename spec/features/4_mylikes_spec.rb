require "rails_helper"

show_tests_in_browser = true
do_not_show_tests_in_browser = false

feature "/my_likes:", js: do_not_show_tests_in_browser do

  scenario "the RCAV works", points: 1 do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit "/my_likes"

    expect(page.status_code).to be(200) # 200 is "OK"
  end

  scenario "only shows photos current user liked", points: 2 do
    first_user = FactoryGirl.create(:user, :username => "alice", :email => "alice@example.com")
    second_user = FactoryGirl.create(:user, :username => "bob", :email => "bob@example.com")
    first_photo = FactoryGirl.create(:photo, :user_id => first_user.id)
    second_photo = FactoryGirl.create(:photo, :user_id => first_user.id)
    third_photo = FactoryGirl.create(:photo, :user_id => second_user.id)
    first_like = FactoryGirl.create(:like, :user_id => second_user.id, :photo_id => first_photo.id)
    second_like = FactoryGirl.create(:like, :user_id => second_user.id, :photo_id => third_photo.id)
    login_as(second_user, :scope => :user)

    visit "/my_likes"

    expect(page.status_code).to be(200) # 200 is "OK"
    expect(page).to have_content(first_like.photo.caption)
    expect(page).to have_css("img[src*='#{first_like.photo.image}']")
    expect(page).to have_content(second_like.photo.caption)
    expect(page).to have_css("img[src*='#{second_like.photo.image}']")
  end

  scenario "header has link to /my_likes", points: 1 do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit "/"

    within("nav") {
      expect(page).to have_link(nil, href: "/my_likes")
    }
  end

end
