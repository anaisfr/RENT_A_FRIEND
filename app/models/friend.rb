class Friend < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  has_many :reviews, through: :bookings

  GENDER = ["male", "female"]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :gender, presence: true, inclusion: { in: Friend::GENDER }
  validates :city, presence: true
  validates :price, presence: true
  validates :description, presence: true
end

# , format: { with: '/\A[a-zA-Z]+\z/', message: "only allow messages" }
# format: { with: '/\A[a-zA-Z]+\z/', message: "only allow messages" }
# , format: { with: '/\A[a-zA-Z]+\z/', message: "only allow messages" }
# format: { with: '/^[0-9]*$/', message: "only allow digits" }
# , format: { with: '^[0-9]*$', message: "only allow digits" }
