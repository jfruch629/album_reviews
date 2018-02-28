require 'spec_helper'
require 'rails_helper'

feature 'user deletes album', %Q{
  As an authenticated user,
  I want to delete an item,
  So that no one can review it
 } do

   scenario 'a signed in user deletes an album they uploaded previously'
   scenario 'a user not signed in attempts to delete an album'
   scenario 'a signed in user attempts to delete another users album'
 end
