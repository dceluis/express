require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:valid_attributes) { { content: 'Hello World!' } }
  let(:invalid_attributes) { { content: "" } }

  let!(:sender) { create(:user) }
  let!(:recipient) { create(:user) }
  let!(:conversation) { create(:conversation, users: [sender, recipient]) }
  let!(:conversation_user) { ConversationUser.where(user: sender, conversation: conversation) }

  let(:valid_session) { { user_id: sender.id } }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: { conversation_id: conversation.id }, session: valid_session
      expect(response).to be_success
    end
  end
end
