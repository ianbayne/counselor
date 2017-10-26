class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = current_user
    @counsellor = @user.counsellor
    @conversation = current_user.mailbox.conversations.first
    # .find(params[:conversation_id])
  end
end
