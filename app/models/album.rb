class Album < ApplicationRecord
  belongs_to :user
  has_many :reviews

  validates_presence_of :title
  validates_presence_of :artist
  validates_presence_of :summary
  validates_presence_of :release_year
end
