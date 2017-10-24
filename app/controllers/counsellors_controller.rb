class CounsellorsController < ApplicationController
  def show
    @counsellor = current_counsellor
  end
end
