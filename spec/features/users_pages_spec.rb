require 'spec_helper'

describe User do
  context 'creating' do
    it 'lets a user sign up' do
      user = FactoryGirl.build :user
      visit root_path
      click_link 'Sign Up'
      fill_in 'Name', with: user.name
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password
      click_button 'Submit'
      page.should have_content "Your user account has been successfully created!"
      page.should have_content "Logged in as #{user.name}"
    end
  end

  context 'sign in' do
    it 'lets a user log in' do
      user = FactoryGirl.create :user
      visit root_path
      click_link 'Login'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Login'
      page.should have_content "Logged in as #{user.name}"
    end
  end
end
