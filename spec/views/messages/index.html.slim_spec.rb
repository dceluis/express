require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  let(:conversation) { build_stubbed(:conversation) }
  let(:conversation_user) { conversation.conversation_users.first }
  let!(:message1) { build_stubbed(:message, conversation_user: conversation_user, content: 'Hello world') }
  let!(:message2) { build_stubbed(:message, conversation_user: conversation_user, content: 'Hello world') }

  before(:each) do
    assign(:conversation, conversation)
    assign(:messages, [ message1, message2 ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", text: message1.user.first_name, count: 1
    assert_select "tr>td", text: message1.content, count: 1
    assert_select "tr>td", text: message2.user.first_name, count: 1
    assert_select "tr>td", text: message2.content, count: 1
  end
end
