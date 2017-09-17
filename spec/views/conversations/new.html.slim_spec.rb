require 'rails_helper'

RSpec.describe "conversations/new", type: :view do
  before(:each) do
    @user = build_stubbed(:user)
    @conversation = assign(:conversation, Conversation.new )
    allow(controller).to receive(:current_user).and_return(@user)
  end

  it "renders new conversation form" do
    render

    assert_select "form[action=?][method=?]", user_conversations_path(@user), "post" do
      assert_select "input[name=?]", "conversation[receiver_id]"
    end
  end
end
