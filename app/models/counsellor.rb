class Counsellor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :appointments
  has_many :users
  mount_uploader :photo, PhotoUploader
  acts_as_messageable
  acts_as_taggable_on :specialty # counsellor.specialty_list is added
  # acts_as_taggable # alias of "acts_as_taggable_on :tags"
  SPECIALTY = [:work_related, :relationship, :loss, :financial]

  SPECIALTYMAP = {
    work_related: "Work-related issues",
    relationship: "Relationship issues",
    loss: "Loss of family or friend issues",
    financial: "Financial issues",
    other: "Other issues"
  }

  def name
    "#{email}"
  end

  def mailboxer_email(object)
    nil
  end
end
