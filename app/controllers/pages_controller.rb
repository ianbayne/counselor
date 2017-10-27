class PagesController < ApplicationController
  skip_before_action :authenticate_person!, only: [:home]

  def home
    # reset session[:answers]
    session.delete(:answers) if session[:answers]
  end
end
