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

# , format: { with: '/\A[a-zA-Z]+\z/', message: "only allow messages" }
# format: { with: '/\A[a-zA-Z]+\z/', message: "only allow messages" }
# , format: { with: '/\A[a-zA-Z]+\z/', message: "only allow messages" }
# format: { with: '/^[0-9]*$/', message: "only allow digits" }
# , format: { with: '^[0-9]*$', message: "only allow digits" }
