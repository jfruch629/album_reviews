class Album < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :artist
  validates_presence_of :summary
  validates_presence_of :starting_year
end
