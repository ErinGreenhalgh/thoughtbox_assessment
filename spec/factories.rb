FactoryGirl.define do
  factory :link do
    url "http://turing.io"
    title "Link Title"
    status "unread"
    user
  end

  factory :user do
    email "erin@gmail.com"
    password "password"
    password_confirmation "password"
  end
end
