require 'rails_helper'
RSpec.describe 'create a post', type: :feature do
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
    click_on 'Stay in touch'
  end

  scenario 'add a new post' do
    fill_in 'post[content]', with: 'chimultrufia'
    click_button 'Save'
    sleep(3)
    expect(page).to have_content('chimultrufia')
  end

  scenario 'see a friends post' do
    fill_in 'post[content]', with: 'chimultrufia'
    click_button 'Save'
    click_on 'Sign out'
    sleep(3)
    visit user_session_path
    fill_in 'user[email]', with: 'morty@rick.com'
    fill_in 'user[password]', with: 'ilikegirls'
    click_button 'Log in'
    expect(page).to have_content('chimultrufia')
  end

  scenario 'see a friends post' do
    fill_in 'post[content]', with: 'chimultrufia'
    click_button 'Save'
    click_on 'Sign out'
    sleep(3)
    visit user_session_path
    fill_in 'user[email]', with: 'morty@rick.com'
    fill_in 'user[password]', with: 'ilikegirls'
    click_button 'Log in'
    click_on 'Like!'
    expect(page).to have_content('Dislike')
  end
end
