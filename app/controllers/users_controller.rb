class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    # @user = current_user
    @user = User.find(6)
    # @counsellor = @user.counsellor
    @counsellor = User.find(7)
    @conversation = @user.mailbox.conversations.participant(@counsellor)
  end
end
