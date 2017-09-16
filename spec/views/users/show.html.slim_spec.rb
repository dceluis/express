require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, build_stubbed(:user))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(%r/#{CGI.escape_html(@user.first_name)}/)
    expect(rendered).to match(%r/#{CGI.escape_html(@user.last_name)}/)
    expect(rendered).to match(%r/#{CGI.escape_html(@user.email)}/)
  end
end
