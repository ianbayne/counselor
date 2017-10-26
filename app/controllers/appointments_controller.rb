class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.new
  end
end
