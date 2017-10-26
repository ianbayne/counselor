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
    @conversation = @user.mailbox.conversations.participant(@counsellor).last if @user.mailbox.conversations.participant(@counsellor).last
  end
end
