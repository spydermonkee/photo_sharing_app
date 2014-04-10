require 'spec_helper'

describe Post do
  context 'creating' do
    it 'lets a signed in user add photos' do
      user = FactoryGirl.build :user
      create_user_and_sign_in(user)
      click_link "#{user.name}"
      click_link 'New post'
      fill_in 'Title', with: "A cool photo!"
      fill_in 'Content', with: "Some stuff!"
      attach_file "post_photo", File.expand_path("./app/assets/images/IMG_3662.JPG")
      click_button "Submit"
      page.should have_xpath "//img[@alt='Img 3662']"
    end
  end

  context 'viewing' do
    it 'lets a user view a post' do
      user = FactoryGirl.build :user
      create_user_and_sign_in(user)
      click_link "#{user.name}"
      click_link 'New post'
      title = Faker::Name.first_name
      fill_in 'Title', with: title
      fill_in 'Content', with: Faker::Lorem.sentence
      attach_file "post_photo", File.expand_path("./app/assets/images/IMG_3662.JPG")
      click_button "Submit"
      click_link "#{title}"
      page.should have_xpath "//img[@alt='Img 3662']"
      page.should have_content "Logged in as #{user.name}"
      page.should have_content "Post: #{title}"
      page.should have_content "Main"
      page.should have_content "Back to my Posts"
    end
  end
end
