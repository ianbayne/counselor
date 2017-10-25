class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :counsellor
  validates: :start_time, :end_time, presence: true
end
