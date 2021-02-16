class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  GENDER = ["male", "female"]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :friends, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :gender, inclusion: { in: User::GENDER }
  validates :email, :password, :first_name, :last_name, :city, :gender, :age, presence: true
end
