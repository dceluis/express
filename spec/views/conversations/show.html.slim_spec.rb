require 'rails_helper'

RSpec.describe "conversations/show", type: :view do
  before(:each) do
    @user = assign(:user, build_stubbed(:user))
    @conversation = assign(:conversation, build_stubbed(:conversation))
    allow(controller).to receive(:current_user).and_return(@user)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(%r/#{CGI.escape_html(@conversation.sender.first_name)}/)
    expect(rendered).to match(%r/#{CGI.escape_html(@conversation.receiver.first_name)}/)
  end
end
