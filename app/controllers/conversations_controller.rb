class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :edit, :update]

  # GET /conversations
  # GET /conversations.json
  def index
    @conversations = current_user.conversations
  end

  # GET /conversations/1
  # GET /conversations/1.json
  def show
  end

  # GET /conversations/1/edit
  def edit
  end

  # PATCH/PUT /conversations/1
  # PATCH/PUT /conversations/1.json
  # def update
  #   respond_to do |format|
  #     if @conversation.update(conversation_params)
  #       format.html { redirect_to @conversation, notice: 'Conversation was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @conversation }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @conversation.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # POST /conversations/1
  # POST /conversations/1.json
  def find_or_create
    other_user = User.find(params[:user_id])
    @conversation = Conversation.exactly_between( current_user, other_user ).first || Conversation.create( users: [ current_user, other_user ] )

    respond_to do |format|
      if @conversation
        format.json { redirect_to conversation_messages_url(@conversation) }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_conversation
    @conversation = Conversation.find(params[:id])
  end
end
