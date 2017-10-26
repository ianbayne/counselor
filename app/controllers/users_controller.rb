class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    # Test Code
    # @user = User.find(6)
    # @counsellor = User.find(7)
    # @conversation = @user.mailbox.conversations.participant(@counsellor).last


    @user = current_user
    @counsellor = @user.counsellor
    if @user.mailbox.conversations.participant(@counsellor).last
      @conversation = @user.mailbox.conversations.participant(@counsellor).last
    else
      # Do something
    end
  end
end
