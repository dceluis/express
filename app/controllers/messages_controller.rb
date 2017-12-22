class MessagesController < ApplicationController
  before_action :require_login
  before_action :set_conversation, only: [:index]

  # GET /messages
  # GET /messages.json
  def index
    @messages = @conversation.messages.includes(:user).order('created_at DESC').page(1)

    conversation_user = ConversationUser.find_by(conversation: @conversation, user: current_user)
    @message = conversation_user.messages.build

    authorize @message
    @other = @conversation.users.find_by('users.id != ?', current_user.id)
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
