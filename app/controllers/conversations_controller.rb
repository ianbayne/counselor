class ConversationsController < ApplicationController
  def index
    @conversations = current_user.mailbox.conversations
  end

  def show
    @conversation = current_user.mailbox.conversations.find(params[:id])
  end

  def new
    @recipients = User.all - [current_user]
    # Removes the current user from the list of potential recipients in the new view
  end

  def create
    recipient = User.find(params[:user_id])
    # Don't need an instance variable (ex: @recipient) because we're not going to use
    # it in a view or anything
    receipt = current_user.send_message(recipient, params[:body], params[:subject])
    redirect_to conversation_path(receipt.conversation)
  end
end
