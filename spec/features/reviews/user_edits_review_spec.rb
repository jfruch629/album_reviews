require 'spec_helper'
require 'rails_helper'

 feature 'updating a review', %Q{
   As an authenticated user,
   I would like to update the review I have posted,
   So that I can more accurately review the album

  } do

    scenario 'authenticated user successfully updates album review'
    scenario 'unauthenticated user attempts to update album review'
    scenario "authenticated user tries to update another user's review"
    scenario "authenticated unsuccesfully updates album review"
  end
