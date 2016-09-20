require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:url) }

  it "can't be created without a user id" do
    user = User.create(email: "e@turing.io", password: "password")
    title = "title"
    url = "http://turing.io"

    link = Link.new(title: title, url: url, user_id: user.id)
    expect(link.save).to be true
    link_no_user = Link.new(title: title, url: url)
    expect(link_no_user.save).to be false
  end

  it "only accepts valid urls" do
    user = User.create(email: "e@turing.io", password: "password")
    title1 = "title"
    url1 = "https://github.com"

    title2 = "title"
    url2 = "invalid"

    link_valid = Link.new(title: title1, url: url1, user_id: user.id)
    link_invalid = Link.new(title: title2, url: url2, user_id: user.id)
    expect(link_valid.save).to be true
    expect(link_invalid.save).to be false
  end

  it "can't be updated with an invalid url" do
    user = User.create(email: "e@turing.io", password: "password")
    link = Link.create(title: "Title", url: "http://turing.io", user_id: user.id)
    new_url = "bad url"

    expect(link.update(url: new_url)).to eq false 
  end
end
