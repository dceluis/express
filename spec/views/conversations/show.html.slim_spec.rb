require 'rails_helper'

RSpec.describe "conversations/show", type: :view do
  let(:user) { create(:user) }
  let(:conversation) { create(:conversation) }

  before(:each) do
    assign(:conversation, conversation)
    allow(controller).to receive(:current_user).and_return(user)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(%r/#{CGI.escape_html(conversation.title)}/)
    expect(rendered).to match(%r/#{CGI.escape_html(conversation.title)}/)
  end
end
