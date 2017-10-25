class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # authenticate :user and :counsellor
  devise_group :person, contains: [:user, :counsellor]
  before_action :authenticate_person!
  # before_action :authenticate_user!
end
