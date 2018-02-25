require 'spec_helper'
require 'rails_helper'

feature 'user signs up', %Q{
  As an authenticated user,
  I want to update my information,
  So that I can keep my profile up to date
 } do

   # ACCEPTANCE CRITERIA:
   # •	I must be signed in to update profile information
   # •	I am able to change First Name, Last Name, Email, & Password
   # •	If I am changing password, I must confirm
  #
  # scenario 'user updates first name' do
  #   user = FactoryBot.create(:user)
  #   visit root_path
  #   click_link 'Sign In'
  #   fill_in 'Email', with: user.email
  #   fill_in 'Password', with: user.password
  #   click_button 'Sign In'
  #
  #   expect(page).to have_content('Sign Out')
  #   expect(page).to_not have_content('Sign In')
  #   expect(page).to have_content('Edit Profile')
  #
  #   click_link 'Edit Profile'
  #   fill_in 'user_first_name', with: 'John'
  #   fill_in 'user_current_password', with: user.password
  #   click_button 'Update'
  #
  #   expect(page).to have_content('Your account has been updated successfully.')
  #   expect(page).to have_content('Edit Profile')
  #   expect(page).to_not have_content('Sign In')
  #
  #   click_link 'Edit Profile'
  #   expect(page).to have_content('John')
  # end
  #
  # scenario 'user updates last name' do
  #   user = FactoryBot.create(:user)
  #   visit root_path
  #   click_link 'Sign In'
  #   fill_in 'Email', with: user.email
  #   fill_in 'Password', with: user.password
  #   click_button 'Sign In'
  #
  #   expect(page).to have_content('Sign Out')
  #   expect(page).to_not have_content('Sign In')
  #   expect(page).to have_content('Edit Profile')
  #
  #   click_link 'Edit Profile'
  #   fill_in 'user_last_name', with: 'Smith'
  #   fill_in 'user_current_password', with: user.password
  #   click_button 'Update'
  #
  #   expect(page).to have_content('Your account has been updated successfully.')
  #   expect(page).to have_content('Edit Profile')
  #   expect(page).to_not have_content('Sign In')
  #
  #   click_link 'Edit Profile'
  #   expect(page).to have_content('Smith')
  #
  # end

  scenario 'user updates email' do
    user = FactoryBot.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content('Sign Out')
    expect(page).to_not have_content('Sign In')
    expect(page).to have_content('Edit Profile')

    click_link 'Edit Profile'
    fill_in 'user_email', with: 'editedemail@example.com'
    fill_in 'user_current_password', with: user.password
    click_button 'Update'

    expect(page).to have_content('Your account has been updated successfully.')
    expect(page).to have_content('Edit Profile')
    expect(page).to_not have_content('Sign In')
    expect(user.email).to eq('editedemail@example.com')
  end

  scenario 'user changes password' do
    user = FactoryBot.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content('Sign Out')
    expect(page).to_not have_content('Sign In')
    expect(page).to have_content('Edit Profile')

    click_link 'Edit Profile'
    fill_in 'user_password', with: 'applejacks'
    fill_in 'user_password_confirmation', with: 'applejacks'
    fill_in 'user_current_password', with: user.password
    click_button 'Update'

    expect(page).to have_content('Your account has been updated successfully.')
    expect(page).to have_content('Edit Profile')
    expect(page).to_not have_content('Sign In')
    expect(user.password).to eq('applejacks')

  end
end
