require 'rails_helper'

RSpec.describe "users/index", type: :view do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  before(:each) do
    assign(:users, [ user1, user2 ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", text: user1.first_name.to_s, count: 1
    assert_select "tr>td", text: user1.last_name.to_s, count: 1
    assert_select "tr>td", text: user1.email.to_s, count: 1
    assert_select "tr>td", text: user2.first_name.to_s, count: 1
    assert_select "tr>td", text: user2.last_name.to_s, count: 1
    assert_select "tr>td", text: user2.email.to_s, count: 1
  end
end
