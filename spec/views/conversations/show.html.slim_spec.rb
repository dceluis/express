require 'rails_helper'

RSpec.describe "conversations/show", type: :view do
  before(:each) do
    @conversation = assign(:conversation, build_stubbed(:conversation))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(%r/#{CGI.escape_html(@conversation.sender.first_name)}/)
    expect(rendered).to match(%r/#{CGI.escape_html(@conversation.receiver.first_name)}/)
  end
end
