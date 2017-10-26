class Answer < ApplicationRecord
  belongs_to :user_profile
  belongs_to :question
end
