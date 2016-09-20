require "rails_helper"

RSpec.describe "api::v1::links_controller" do
  it "can create a link" do
    user = User.create(email: "erin@turing.io", password: "password")
    link_data = {title: "Turing School", url: "http://turing.io", user_id: user.id}
    post "/api/v1/links", params: {link: link_data}
    expect(response).to be_success
    expect(Link.count).to eq 1
    link = Link.last
    expect(link.title).to   eq link_data[:title]
    expect(link.url).to     eq link_data[:url]
    expect(link.user).to    eq user
    expect(link.status).to  eq "false"
  end

   it "can't create a link with an invalid url" do
     user = User.create(email: "erin@turing.io", password: "password")
     link_data = {title: "Turing School", url: "bad_url", user_id: user.id}
     post "/api/v1/links", params: {link: link_data}
     expect(response).to be_success
     expect(Link.count).to eq 0
   end

  it "gives a list of links for that user" do
    user1 = User.create(email: "erin@turing.io", password: "password")
    user2 = User.create(email: "hello@turing.io", password: "password")
    link1 = Link.create(url: "http://turing.io", title: "Turing", user: user1)
    link2 = Link.create(url: "http://today.turing.io", title: "Today", user: user2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    get '/api/v1/links'

    expect(response).to be_success
    expect(response.status).to eq 200

    data = JSON.parse(response.body)
    expect(data.count).to eq 1
    expect(data[0]["url"]).to eq "http://turing.io"
    expect(data[0]["title"]).to eq "Turing"
    expect(data[0]["status"]).to eq "false"
  end

  it "can update a link" do
    user = User.create(email: "erin@turing.io", password: "password")
    link = Link.create(url: "http://turing.io", title: "Turing", user: user)

    new_title  = "New Title"
    new_url    = "https://github.com"
    new_status = "true"

    link_data = {title: new_title, url: new_url, status: new_status}

    patch "/api/v1/links/#{link.id}", params: {link: link_data}

    expect(response).to be_success
    expect(response.status).to eq 200

    data = JSON.parse(response.body)
    expect(data["title"]).to eq new_title
    expect(data["url"]).to eq new_url
    expect(data["status"]).to eq new_status
  end
end
