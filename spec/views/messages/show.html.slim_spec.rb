require 'rails_helper'

RSpec.describe "messages/show", type: :view do
  before(:each) do
    @message = assign(:message, build_stubbed(:message) )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(%r/#{CGI.escape_html(@message.conversation.title)}/)
    expect(rendered).to match(%r/#{CGI.escape_html(@message.user.first_name)}/)
    expect(rendered).to match(%r/#{CGI.escape_html(@message.content)}/)
  end
end
