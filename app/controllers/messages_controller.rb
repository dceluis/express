class MessagesController < ApplicationController
  before_action :set_conversation, only: [:index]

  # GET /messages
  # GET /messages.json
  def index
    @messages = @conversation.messages
    @message  = Message.new
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:content)
  end
end
