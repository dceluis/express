require 'rails_helper'

RSpec.describe "conversations/index", type: :view do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:user3) { create(:user) }
  let(:conversation1) { create(:conversation, users: [user1, user2]) }
  let(:conversation2) { create(:conversation, users: [user1, user3]) }

  before(:each) do
    assign(:conversations, [conversation1, conversation2])
    allow(controller).to receive(:current_user).and_return(user1)
  end

  it "renders a list of conversations" do
    render
    assert_select "tr>td", text: conversation1.title, count: 1
    assert_select "tr>td", text: conversation2.title, count: 1
  end
end
