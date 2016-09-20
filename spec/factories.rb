FactoryGirl.define do
  factory :link do
    url "http://turing.io"
    title "Link Title"
    user
  end

  factory :user do
    email "erin@gmail.com"
    password "password"
    password_confirmation "password"

    factory :user_with_links do
      transient do
        links_count 2
      end
    end
  end
end 
