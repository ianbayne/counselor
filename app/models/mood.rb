class Mood < ApplicationRecord
  belongs_to :user
  validates :mood, presence: true
  validates :mood, inclusion: { in: [1,2,3,4,5] }
end
