require 'spec_helper'
require 'rails_helper'

 feature 'deleting a review', %Q{
   As an authenticated user
   I would like to delete the review I have posted
   So that I can decide what I want to put on the site
  } do

    scenario 'authenticated user deletes their created album review'
    scenario 'unauthenticated user fails to delete a review they created while signed in'
    scenario 'authenticated user attempts to delete another users review'
  end
