class MessagesController < ApplicationController
  before_action :set_conversation

  def create
    receipt = current_user.reply_to_conversation(@conversation, params[:body]) #send_message is for creating a new conversation. reply_to_conversation is for replying to a conversation
    # redirect_to conversation_path(receipt.conversation)
    format.html {redirect_to root_url}
    format.js
  end

  private

  def set_conversation
    @conversation = current_user.mailbox.conversations.find(params[:conversation_id])
  end
end
