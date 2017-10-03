require 'rails_helper'

RSpec.describe "notifications/index", type: :view do
  let(:user) { build_stubbed(:user) }

  before(:each) do
    assign(:notifications, [
      build_stubbed(:notification, user: user),
      build_stubbed(:notification, user: user)
    ])
  end

  it "renders a list of notifications" do
    render
  end
end
