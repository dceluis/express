require 'rails_helper'

RSpec.describe "conversations/index", type: :view do
  let(:user) { build_stubbed(:user) }
  let(:conversation1) { build_stubbed(:conversation, recipient: user) }
  let(:conversation2) { build_stubbed(:conversation, sender: user) }

  before(:each) do
    assign(:conversations, [conversation1, conversation2])
    allow(controller).to receive(:current_user).and_return(user)
  end

  it "renders a list of conversations" do
    render
    assert_select "tr>td", text: conversation1.partner_name(user), count: 1
    assert_select "tr>td", text: conversation2.partner_name(user), count: 1
  end
end
