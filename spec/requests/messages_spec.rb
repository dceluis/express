require 'rails_helper'

RSpec.describe "Messages", type: :request do
  describe "GET /messages" do
    let(:conversation) { create(:conversation) }
    it "works! (now write some real specs)" do
      get conversation_messages_path(conversation)
      expect(response).to have_http_status(200)
    end
  end
end
