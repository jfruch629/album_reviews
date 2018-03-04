class User < ApplicationRecord
  has_many :albums
  has_many :reviews
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :email, :presence => true, :email => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
   self.role == "admin"
  end
end
