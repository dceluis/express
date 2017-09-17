require 'rails_helper'

RSpec.describe "messages/new", type: :view do

  before(:each) do
    @conversation = build_stubbed(:conversation)
    assign(:message, Message.new )
  end

  it "renders new message form" do
    render

    assert_select "form[action=?][method=?]", conversation_messages_path(@conversation), "post" do

      assert_select "input[name=?]", "message[conversation_id]"

      assert_select "input[name=?]", "message[user_id]"

      assert_select "input[name=?]", "message[content]"
    end
  end
end
