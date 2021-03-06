class AppointmentsController < ApplicationController
before_action :set_appointment, only: [:show, :edit, :update, :destroy]

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

    user_id = ZoomusClient.user_list['users'][0]['id']
    @appointment.url = ZoomusClient.meeting_create(host_id: user_id, topic: " Counseling Session", type: 2, start_time: @appointment.start_time)['join_url']

    begin
    user_list = ZoomusClient.user_list!
    rescue Zoomus::Error => exception
      puts 'Something went wrong'
    end

    if @appointment.save
      redirect_to user_path(current_user)
    else
      render :index
    end

  end

  def show
  end

  def destroy
    @appointment.destroy
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    # New for following URL
    # https://www.driftingruby.com/episodes/fullcalendar-events-and-scheduling#show_notes
    params.require(:appointment).permit("start_time")

    # Previous version
    # params.require(:appointment).permit("start_time(1i)", "start_time(2i)",
    #  "start_time(3i)", "start_time(4i)", "start_time(5i)")
  end
end
