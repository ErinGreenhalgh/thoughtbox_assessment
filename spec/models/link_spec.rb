require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should belong_to(:user) }

  it "can't be created without a user id" do
    user = User.create(email: "e@turing.io", password: "password")
    title = "title"
    url = "turing.io"

    link = Link.new(title: title, url: url, user_id: user.id)
    expect(link.save).to be true
  end
end
