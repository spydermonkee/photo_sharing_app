require 'spec_helper'

describe Tag do
  context 'create tag' do
    it 'lets users create a tag' do
      user = FactoryGirl.build :user
      create_user_and_sign_in(user)
      click_link "#{user.name}"
      click_link 'New post'
      title = Faker::Name.first_name
      fill_in 'Title', with: title
      fill_in 'Content', with: "Some stuff!"
      attach_file "post_photo", File.expand_path("./app/assets/images/IMG_3662.JPG")
      click_button "Submit"
      click_link "#{title}"
      click_button "Add Tag"
    end
  end
end
