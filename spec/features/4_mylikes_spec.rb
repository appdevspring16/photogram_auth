require "rails_helper"

show_tests_in_browser = true
do_not_show_tests_in_browser = false

feature "My_likes:", js: do_not_show_tests_in_browser do

  scenario "RCAV set for /my_likes", points: 1 do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit "/my_likes"

    expect(page.status_code).to be(200) # 200 is "OK"
  end

  scenario "only shows photos current user liked", points: 2 do
    user_1 = FactoryGirl.create(:user, :username => "1", :email => "1@m.com")
    user_2 = FactoryGirl.create(:user, :username => "2", :email => "2@m.com")
    photo_1 = FactoryGirl.create(:photo, :user_id => user_1.id)
    photo_2 = FactoryGirl.create(:photo, :user_id => user_1.id)
    photo_3 = FactoryGirl.create(:photo, :user_id => user_2.id)
    like_1 = FactoryGirl.create(:like, :user_id => user_2.id, :photo_id => photo_1.id)
    like_2 = FactoryGirl.create(:like, :user_id => user_2.id, :photo_id => photo_3.id)
    login_as(user_2, :scope => :user)

    visit "/my_likes"

    expect(page.status_code).to be(200) # 200 is "OK"
    expect(page).to have_content(like_1.photo.caption)
    expect(page).to have_css("img[src*='#{like_1.photo.image}']")
    expect(page).to have_content(like_2.photo.caption)
    expect(page).to have_css("img[src*='#{like_2.photo.image}']")
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
