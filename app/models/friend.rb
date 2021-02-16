class Friend < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  GENDER = ["male", "female"]

  validates :first_name, presence: true, format: { with: '/\A[a-zA-Z]+\z/', message: "only allow messages" }
  validates :last_name, presence: true, format: { with: '/\A[a-zA-Z]+\z/', message: "only allow messages" }
  validates :age, presence: true, format: { with: '/^[0-9]*$/', message: "only allow digits" }
  validates :gender, presence: true, inclusion: { in: Friend::GENDER }
  validates :city, presence: true, format: { with: '/\A[a-zA-Z]+\z/', message: "only allow messages" }
  validates :price, presence: true, format: { with: '^[0-9]*$', message: "only allow digits" }
  has_one_attached :photo
end
