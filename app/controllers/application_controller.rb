class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # authenticate :user and :counsellor
  devise_group :person, contains: [:user, :counsellor]
  before_action :authenticate_person!
  # before_action :authenticate_user!

  before_action :set_locale

  def set_locale
    I18n.locale = params.fetch(:locale, I18n.default_locale).to_sym
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end
end
