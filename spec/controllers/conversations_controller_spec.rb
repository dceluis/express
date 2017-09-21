require "rails_helper"
RSpec.describe ConversationsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Conversation. As you add validations to Conversation, be sure to
  # adjust the attributes here as well.
  let!(:sender) { create(:user) }
  let!(:recipient) { create(:user) }
  let(:valid_attributes) { { users: [sender, recipient] } }

  let(:invalid_attributes) { {} }

  let!(:conversation) { Conversation.create! valid_attributes }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ConversationsController. Be sure to keep this updated too.
  let(:valid_session) { { user_id: sender.id } }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { user_id: sender.id, id: conversation.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: { id: conversation.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested conversation" do
  #       put :update, params: { id: conversation.to_param, conversation: new_attributes }, session: valid_session
  #       conversation.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "redirects to the conversation" do
  #       put :update, params: { id: conversation.to_param, conversation: valid_attributes }, session: valid_session
  #       expect(response).to redirect_to(conversation)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'edit' template)" do
  #       put :update, params: { id: conversation.to_param, conversation: invalid_attributes }, session: valid_session
  #       expect(response).to be_success
  #     end
  #   end
  # end
end
