class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    # Test Code
    # @user = User.find(16)
    # @counsellor = User.find(17)
    # @conversation = @user.mailbox.conversations.participant(@counsellor).last

    @user = current_user
    @counsellor = @user.counsellor

    @mood = Mood.new

    @chart_duration_days = 10
    if @user.moods.count - @chart_duration_days >= 0 
      @ten_days_moods = @user.moods.limit(10).offset(@user.moods.count - @chart_duration_days)
    else
      @ten_days_moods = @user.moods.limit(10)
    end
    # @ten_days_moods = @user.moods.order(created_at: :desc).limit(10)
    p @ten_days_moods
    unless @ten_days_moods.empty?
      @start_day = @ten_days_moods.first.created_at.strftime("%B %d")
      @end_day = @ten_days_moods.last.created_at.strftime("%B %d")
    end

    # Original code before movement of calendar
    # @appointment = Appointment.new

    # Code required for moving calendar
    @appointments = @user.counsellor.appointments


    # @appointment = Appointment.new
    @goal = Goal.new

    @user_moods = @user.moods.order(created_at: :desc).limit(10)
    p @user_moods
    # check for activate mood tracker
    @today = Date.today.to_date
    @mood_tracker_check = true
    @user_moods.each do |mood|
      # if user already created mood today, not show modal.
      @mood_tracker_check = false if mood.created_at.to_date == @today
    end

    # Is this the reason why conversations don't show the initial text box if
    # a counselor has more than one user?
    if @user.mailbox.conversations.participant(@counsellor).last
      @conversation = @user.mailbox.conversations.participant(@counsellor).last
    else
      @recipients = @counsellor
    end

  end
end
