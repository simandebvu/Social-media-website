require 'rails_helper'
RSpec.describe 'login followed by logout', type: :feature do
  feature 'Signing up' do
    scenario 'sign up user' do
      visit new_user_registration_path
      fill_in 'user[name]', with: 'BirdPerson'
      fill_in 'user[email]', with: 'phoenix@fly.com'
      fill_in 'user[password]', with: 'rickismyfriend'
      fill_in 'user[password_confirmation]', with: 'rickismyfriend'
      click_button 'Sign up'
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
  end
  feature 'Signing in' do
    before(:each) do
      @user = User.new(name: 'Morty', email: 'morty@rick.com', password: 'ilikegirls')
      @user.save
    end

    scenario 'sign in user' do
      visit new_user_session_path
      fill_in 'user[email]', with: 'morty@rick.com'
      fill_in 'user[password]', with: 'ilikegirls'
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
    end
  end
end
