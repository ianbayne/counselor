class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :appointments
  # has_many :user_profile
  has_many :answers
  belongs_to :counsellor

  acts_as_messageable

  def name
    "#{email}"
  end

  def mailboxer_email(object)
    nil
  end
end
