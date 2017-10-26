class ConversationsController < ApplicationController
  def index
    if current_user
      @conversations = current_user.mailbox.conversations
    elsif current_counsellor
      @conversations = current_counsellor.mailbox.conversations
    end
  end

  def show
    if current_user
      @conversation = current_user.mailbox.conversations.find(params[:id])
    elsif current_counsellor
      @conversation = current_counsellor.mailbox.conversations.find(params[:id])
    end
  end

  def new
    # Removes the current user from the list of potential recipients in the new view
    # @recipients = User.all - [current_user]
    if current_user
      @recipients = Counsellor.all
    elsif current_counsellor
      @recipients = User.all
    end
  end

  def create
    # recipient = User.find(params[:user_id])
    # Don't need an instance variable (ex: @recipient) because we're not going to use
    # it in a view or anything
    if current_user
      recipient = Counsellor.find(params[:counsellor_id])
      receipt = current_user.send_message(recipient, params[:body], params[:subject])
    elsif current_counsellor
      recipient = User.find(params[:user_id])
      receipt = current_counsellor.send_message(recipient, params[:body], params[:subject])
    end
    redirect_to conversation_path(receipt.conversation)
  end
end
