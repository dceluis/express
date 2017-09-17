require 'rails_helper'

RSpec.describe "conversations/index", type: :view do
  let(:user) { build_stubbed(:user) }
  let(:conversation1) { build_stubbed(:conversation) }
  let(:conversation2) { build_stubbed(:conversation) }

  before(:each) do
    assign(:user, user)
    assign(:conversations, [ conversation1, conversation2 ])
  end

  it "renders a list of conversations" do
    render
    assert_select "tr>td", text: conversation1.sender.first_name, count: 1
    assert_select "tr>td", text: conversation1.receiver.first_name, count: 1
    assert_select "tr>td", text: conversation2.sender.first_name, count: 1
    assert_select "tr>td", text: conversation2.receiver.first_name, count: 1
  end
end
