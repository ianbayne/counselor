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
    @ten_days_moods = @user.moods.limit(10)
    unless @ten_days_moods.empty?
      @start_day = @ten_days_moods.first.created_at.strftime("%B %d")
      @end_day = @ten_days_moods.last.created_at.strftime("%B %d")
    end

    @appointment = Appointment.new

    if @user.mailbox.conversations.participant(@counsellor).last
      @conversation = @user.mailbox.conversations.participant(@counsellor).last
    else
      @recipients = @counsellor
    end

  end
end
