require 'rails_helper'
RSpec.describe 'get a new friend', type: :feature do
  before(:each) do
    @user = User.new(name: 'Morty', email: 'morty@rick.com', password: 'ilikegirls')
    @user.save
    @user2 = User.new(name: 'mono', email: 'mono@rick.com', password: 'ilikethevoid')
    @user2.save
    visit user_session_path
    fill_in 'user[email]', with: 'morty@rick.com'
    fill_in 'user[password]', with: 'ilikegirls'
    click_button 'Log in'
    sleep(3)
  end
  scenario 'invite a friend' do
    visit users_path
    click_on 'Add'
    expect(page).to have_content('Sent request succesfully!')
  end

  scenario 'accept invitation' do
    visit users_path
    click_on 'Add'
    click_on 'Sign out'
    sleep(3)
    visit user_session_path
    fill_in 'user[email]', with: 'mono@rick.com'
    fill_in 'user[password]', with: 'ilikethevoid'
    click_button 'Log in'
    visit users_path
    click_on 'Accept'
    expect(page).to have_content('You are now friends.')
  end

  scenario 'accept invitation' do
    visit users_path
    click_on 'Add'
    click_on 'Sign out'
    sleep(3)
    visit user_session_path
    fill_in 'user[email]', with: 'mono@rick.com'
    fill_in 'user[password]', with: 'ilikethevoid'
    click_button 'Log in'
    visit users_path
    click_on 'Reject'
    expect(page).to have_content('Succesfully unfriended.')
  end

  scenario 'they are all friends' do
    visit users_path
    click_on 'Add'
    click_on 'Sign out'
    sleep(3)
    visit user_session_path
    fill_in 'user[email]', with: 'mono@rick.com'
    fill_in 'user[password]', with: 'ilikethevoid'
    click_button 'Log in'
    visit users_path
    click_on 'Accept'
    expect(page).to have_content('Unfriend')
    click_on 'Sign out'
    visit user_session_path
    fill_in 'user[email]', with: 'morty@rick.com'
    fill_in 'user[password]', with: 'ilikegirls'
    click_button 'Log in'
    visit users_path
    expect(page).to have_content('Unfriend')
  end
end
