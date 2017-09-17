require 'rails_helper'

RSpec.describe "Conversations", type: :request do
  describe "GET /conversations" do
    let(:user) { create(:user) }
    it "works! (now write some real specs)" do
      get user_conversations_path(user)
      expect(response).to have_http_status(200)
    end
  end
end
