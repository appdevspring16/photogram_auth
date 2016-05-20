require "rails_helper"

show_tests_in_browser = true
do_not_show_tests_in_browser = false

feature "Photos:", js: do_not_show_tests_in_browser do

  scenario "only show edit/delete for signed-in user's photos", points: 2 do
    user_1 = FactoryGirl.create(:user, :username => "1", :email => "1@m.com")
    user_2 = FactoryGirl.create(:user, :username => "2", :email => "2@m.com")
    photo_1 = FactoryGirl.create(:photo, :user_id => user_1.id)
    photo_2 = FactoryGirl.create(:photo, :user_id => user_2.id)
    login_as(user_2, :scope => :user)

    visit "/photos"

    expect(page).not_to have_link(nil, href: "/photos/#{photo_1.id}/edit")
    expect(page).not_to have_link(nil, href: "/delete_photo/#{photo_1.id}")
    expect(page).to have_link(nil, href: "/photos/#{photo_2.id}/edit")
    expect(page).to have_link(nil, href: "/delete_photo/#{photo_2.id}")
  end

  scenario "in /photos, Bootstrap panels used", points: 1 do
    user = FactoryGirl.create(:user)
    photo = FactoryGirl.create(:photo, :user_id => user.id)
    login_as(user, :scope => :user)

    visit "/photos"

    expect(page).to have_css(".panel")
  end

  scenario "in /photos, Font Awesome fa-plus icon used (and 'Photos' h1 tag isn't)", points: 1 do
    user = FactoryGirl.create(:user)
    photo = FactoryGirl.create(:photo, :user_id => user.id)
    login_as(user, :scope => :user)

    visit "/photos"

    expect(page).to have_css(".fa-plus")
    expect(page).not_to have_selector("h1", text: "Photos")
  end

  scenario "/photos displays per-photo username, photo, and time elapsed", points: 1, hint: "Time elapsed ends in 'ago' (e.g., '5 months ago')." do
    user_1 = FactoryGirl.create(:user, :username => "user_1", :email => "1@m.com")
    user_2 = FactoryGirl.create(:user, :username => "user_2", :email => "2@m.com")
    user_3 = FactoryGirl.create(:user, :username => "Three", :email => "three@m.com")
    photo_1 = FactoryGirl.create(:photo, :user_id => user_1.id)
    photo_2 = FactoryGirl.create(:photo, :user_id => user_2.id)
    login_as(user_3, :scope => :user)

    visit "/photos"

    expect(page).to have_content("#{photo_1.user.username}")
    expect(page).to have_css("img[src*='#{photo_1.image}']")
    expect(page).to have_content("#{photo_2.user.username}")
    expect(page).to have_css("img[src*='#{photo_2.image}']")
    expect(page).to have_content("ago")
  end

  scenario "header uses Font Awesome fa-sign-out icon", points: 1 do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit "/photos"

    within("nav") {
      expect(page).to have_css(".fa-sign-out")
    }
  end

  scenario "/photos lists comments with authors", points: 1 do
    user_1 = FactoryGirl.create(:user, :username => "1", :email => "1@m.com")
    user_2 = FactoryGirl.create(:user, :username => "2", :email => "2@m.com")
    user_3 = FactoryGirl.create(:user, :username => "Three", :email => "three@m.com")
    photo_1 = FactoryGirl.create(:photo, :user_id => user_3.id)
    photo_2 = FactoryGirl.create(:photo, :user_id => user_3.id)
    photo_3 = FactoryGirl.create(:photo, :user_id => user_3.id)
    comment_1 = FactoryGirl.create(:comment, :user_id => user_1.id, :body => "comment_1", :photo_id => photo_1.id)
    comment_2 = FactoryGirl.create(:comment, :user_id => user_2.id, :body => "comment_two", :photo_id => photo_3.id)
    login_as(user_3, :scope => :user)

    visit "/photos"

    expect(page).to have_content(comment_1.body)
    expect(page).to have_content(comment_1.user.username)
    expect(page).to have_content(comment_2.body)
    expect(page).to have_content(comment_2.user.username)
  end

  scenario "/photos shows Font Awesome heart icons to add/delete likes", points: 1, hint: "Font Awesome icon classes: fa-heart and fa-heart-o." do
    user_1 = FactoryGirl.create(:user, :username => "1", :email => "1@m.com")
    user_2 = FactoryGirl.create(:user, :username => "2", :email => "2@m.com")
    photo_1 = FactoryGirl.create(:photo, :user_id => user_2.id)
    photo_2 = FactoryGirl.create(:photo, :user_id => user_2.id)
    like_1 = FactoryGirl.create(:like, :user_id => user_1.id, :photo_id => photo_1.id)
    like_2 = FactoryGirl.create(:like, :user_id => user_2.id, :photo_id => photo_2.id)
    login_as(user_1, :scope => :user)

    visit "/photos"

    expect(page).to have_css(".fa-heart")
    expect(page).to have_css(".fa-heart-o")
  end

  scenario "/photos includes form field with placeholder 'Add a comment...'", points: 1 do
    user = FactoryGirl.create(:user, :username => "1", :email => "1@m.com")
    photo = FactoryGirl.create(:photo, :user_id => user.id)
    login_as(user, :scope => :user)

    visit "/photos"

    expect(page).to have_selector("input[placeholder='Add a comment...']")
  end
end

feature "Photos:", js: show_tests_in_browser do

  scenario "quick-add a comment works and leads back to /photos", points: 2 do
    user_1 = FactoryGirl.create(:user, :username => "1", :email => "1@m.com")
    user_2 = FactoryGirl.create(:user, :username => "user_2", :email => "two@m.com")
    photo = FactoryGirl.create(:photo, :user_id => user_1.id)
    login_as(user_2, :scope => :user)

    visit "/photos"
    new_comment = "Just added a comment at #{Time.now.to_f}"
    fill_in("Add a comment...", with: new_comment)
    find_field("Add a comment...").native.send_keys(:return)

    expect(page).to have_content(new_comment)
    expect(page).to have_current_path("/photos")
  end

  scenario "quick-add a comment sets the author correctly", points: 1, hint: "Test assumes that each row in /comments lists either the author's ID or username." do
    user_1 = FactoryGirl.create(:user, :username => "1", :email => "1@m.com")
    user_2 = FactoryGirl.create(:user, :username => "user_2", :email => "two@m.com", :id => "#{Time.now.to_i}")
    photo = FactoryGirl.create(:photo, :user_id => user_1.id)
    login_as(user_2, :scope => :user)

    visit "/photos"
    new_comment = "Just added a comment at #{Time.now.to_f + Time.now.to_f}"
    fill_in("Add a comment...", with: new_comment)
    find_field("Add a comment...").native.send_keys(:return)
    visit "/comments"

    expect(page).to have_content(new_comment)
    within('tr', text: new_comment) do
      if page.has_content?(user_2.id)
        expect(page).to have_content(user_2.id)
      else
        expect(page).to have_content(user_2.username)
      end
    end
  end

  scenario "quick-add a like works in /photos", points: 2 do
    user = FactoryGirl.create(:user, :username => "1", :email => "1@m.com")
    photo = FactoryGirl.create(:photo, :user_id => user.id)
    login_as(user, :scope => :user)

    visit "/photos"
    find(".fa-heart-o").click

    expect(page).to have_css(".fa-heart")
  end

  scenario "quick-delete a like works in /photos", points: 1 do
    user = FactoryGirl.create(:user, :username => "1", :email => "1@m.com")
    photo = FactoryGirl.create(:photo, :user_id => user.id)
    like = FactoryGirl.create(:like, :user_id => user.id, :photo_id => photo.id)
    login_as(user, :scope => :user)

    visit "/photos"

    if page.has_link?(nil, href: "/delete_like/#{like.id}")
      expect(page).to have_css(".fa-heart")
      expect(page).to have_link(nil, href: "/delete_like/#{like.id}")
    else
      find(".fa-heart").click
      expect(page).to have_css(".fa-heart-o")
    end
  end

end
