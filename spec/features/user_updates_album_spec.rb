require 'rails_helper'

feature 'user updates an album', %Q{
  As an authenticated user,
  I want to update an item's information,
  So that I can correct errors or provide new information
 } do

  # ACCEPTANCE CRITERIA:
  # •	I must be signed in to update album information
  # •	I must be able to get to Edit page from the index OR show page

  scenario 'a signed in user successfully updates their album' do
    # For this & the tests below, I need to include verifying with a password

    user = FactoryBot.create(:user)
    album = FactoryBot.create(:album, user: user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    click_link album.title
    click_link 'Update'
    fill_in 'album_title', with: 'Summer 0Edited'
    fill_in 'album_artist', with: 'Metro-edited'
    fill_in 'album_summary', with: 'Edited Summary'
    fill_in 'album_starting_year', with: '2000-never'

    click_button 'Save'

    expect(page).to have_content('Album Updated')
  end

  scenario 'a signed in user does not successfully update their album'
  # For this & the test before, I need to include verifying with a password
  scenario 'unauthenticated user attempts to update an album'
  scenario 'authenticated user attempts to update someone elses album'
end
