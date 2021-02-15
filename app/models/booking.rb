class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :friend

  STATUS = ['pending', 'accepted', 'denied']

  validates :user, presence: true, uniqueness: { scope: :friend }
  validates :friend, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, inclusion: { in: STATUS }
end
