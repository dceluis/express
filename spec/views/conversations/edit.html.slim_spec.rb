require 'rails_helper'

RSpec.describe 'conversations/edit', type: :view do
  before(:each) do
    @user = build_stubbed(:user)
    @conversation = assign(:conversation, build_stubbed(:conversation))
    allow(controller).to receive(:current_user).and_return(@user)
  end

  it 'renders the edit conversation form' do
    render

    assert_select 'form[action=?][method=?]', conversation_path(@conversation), 'post' do
      assert_select 'input[name=?]', 'conversation[receiver_id]'
    end
  end
end
