class Friend < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  GENDER = ["male", "female"]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :gender, presence: true, inclusion: { in: Friend::GENDER }
  validates :city, presence: true
  validates :price, presence: true
  has_one_attached :photo
end
