require 'rails_helper'

RSpec.describe "stories/index", type: :view do
  let!(:story1) { create(:message_story) }
  let!(:story2) { create(:message_story) }

  before(:each) do
    assign(:stories, [ story1, story2 ])
  end

  it "renders a list of stories" do
    render
    expect(rendered).to match(%r/MessageStory/)
  end
end
