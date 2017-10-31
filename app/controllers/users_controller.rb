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
    @appointment = Appointment.new

    @user_moods = @user.moods.order(created_at: :desc).limit(10)
    # check for activate mood tracker
    @today = Date.today.to_date
    @mood_tracker_check = true
    @user_moods.each do |mood|
      # if user already created mood today, not show modal.
      @mood_tracker_check = false if mood.created_at.to_date == @today
    end

    if @user.mailbox.conversations.participant(@counsellor).last
      @conversation = @user.mailbox.conversations.participant(@counsellor).last
    else
      @recipients = @counsellor
    end

  end
end
