require "rails_helper"

RSpec.describe "api::v1::links_controller" do
  it "can create a link" do
    user = User.create(email: "erin@turing.io", password: "password")
    link_data = {title: "Turing School", url: "turing.io", user_id: user.id}
    post "/api/v1/links", params: {link: link_data}
    expect(response).to be_success
    expect(Link.count).to eq 1
    link = Link.last
    expect(link.title).to   eq link_data[:title]
    expect(link.url).to     eq link_data[:url]
    expect(link.user).to    eq user
    expect(link.status).to  eq "false"
  end
end
