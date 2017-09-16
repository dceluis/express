require 'rails_helper'

RSpec.describe "conversations/new", type: :view do
  before(:each) do
    assign(:conversation, Conversation.new(
      :sender => nil,
      :receiver => nil
    ))
  end

  it "renders new conversation form" do
    render

    assert_select "form[action=?][method=?]", conversations_path, "post" do

      assert_select "input[name=?]", "conversation[sender_id]"

      assert_select "input[name=?]", "conversation[receiver_id]"
    end
  end
end
