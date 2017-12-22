require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  let(:conversation) { create(:conversation) }
  let(:conversation_user1) { conversation.conversation_users.first }
  let(:conversation_user2) { conversation.conversation_users.last }
  let!(:message1) { create(:message, conversation_user: conversation_user1, content: 'Hello world') }
  let!(:message2) { create(:message, conversation_user: conversation_user2, content: 'Hello Back') }
  let!(:new_message) { build(:message, conversation_user: conversation_user1) }

  before(:each) do
    assign(:conversation, conversation)
    assign(:other, conversation_user2.user )
    assign(:messages, [ message1, message2 ])
    assign(:message, new_message)
  end

  # it "renders a list of messages" do
  #   render
  #   assert_select "tr>td", text: message1.user.first_name, count: 1
  #   assert_select "tr>td", text: message1.content, count: 1
  #   assert_select "tr>td", text: message2.user.first_name, count: 1
  #   assert_select "tr>td", text: message2.content, count: 1
  # end
end
