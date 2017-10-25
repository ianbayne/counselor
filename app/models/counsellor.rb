class Counsellor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :appointments
  has_many :users
  mount_uploader :photo, PhotoUploader
  acts_as_messageable

  def name
    "User #{id}"
  end

  def mailboxer_email(object)
    nil
  end
end
