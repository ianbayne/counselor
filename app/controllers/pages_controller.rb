class PagesController < ApplicationController
  skip_before_action :authenticate_person!, only: [:home]

  def home
  end
end
