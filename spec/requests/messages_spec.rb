require 'rails_helper'

RSpec.describe "Messages", type: :request do
  describe "GET /messages" do
    let(:conversation) { create(:conversation) }
    it "redirects if user not logged in" do
      get conversation_messages_path(conversation)
      expect(response).to have_http_status(302)
    end
  end
end
