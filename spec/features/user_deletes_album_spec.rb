require 'spec_helper'
require 'rails_helper'

feature 'user deletes album', %Q{
  As an authenticated user,
  I want to delete an item,
  So that no one can review it
 } do

   scenario 'a signed in user deletes an album they uploaded previously' do
     album = FactoryBot.create(:album,
      user: FactoryBot.create(:user, first_name: "Jill", last_name: "Scott", email: "jill@example.com", password: "password"))

     visit root_path
     click_link 'Sign In'
     fill_in 'Email', with: album.user.email
     fill_in 'Password', with: album.user.password
     click_button 'Sign In'

     click_link 'Summer 08'
     click_link 'Destroy'

     expect(page).to have_content('Album successfully removed.')
     expect(page).to_not have_content('Summer 08')
     expect(page).to_not have_content('Sign In')
   end

   scenario 'a user not signed in attempts to delete an album' do
     album = FactoryBot.create(:album,
      user: FactoryBot.create(:user, first_name: "Jill", last_name: "Scott", email: "jill@example.com", password: "password"))

     visit root_path
     click_link 'Sign In'
     fill_in 'Email', with: album.user.email
     fill_in 'Password', with: album.user.password
     click_button 'Sign In'

     click_link 'Sign Out'
     click_link 'Summer 08'

     expect(page).to_not have_content('Destroy')
   end

   scenario 'a signed in user attempts to delete another users album' do
   user = User.create({first_name: "John", last_name: "Smith", email: "johnsmith@example.com", password: "johnsmith"})
   album = FactoryBot.create(:album,
    user: FactoryBot.create(:user, first_name: "Jill", last_name: "Scott", email: "jill@example.com", password: "password"))

   visit root_path
   click_link 'Sign In'
   fill_in 'Email', with: user.email
   fill_in 'Password', with: user.password
   click_button 'Sign In'

   click_link "Summer 08"

   expect(page).to have_content('Jill Scott (jill@example.com) uploaded this album page on')
   expect(page).to_not have_content('Destroy')
 end
end
