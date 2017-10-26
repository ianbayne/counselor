class AppointmentsController < ApplicationController
  def index
    @user = current_user
    @appointments = @user.counsellor.appointments
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @end_time = @appointment.start_time + 1.hours
    @appointment.end_time = @end_time
    @appointment.user = current_user
    @appointment.counsellor = current_user.counsellor
    if @appointment.save
      redirect_to appointments_path
    else
      render :index
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit("start_time(1i)", "start_time(2i)",
     "start_time(3i)", "start_time(4i)", "start_time(5i)")
  end
end
