require "rails_helper"

RSpec.feature "filter by link status" do

  scenario "filter by read", js: true do
    user = create(:user)
    link1 = create(:link, user: user, title: "Title 1")
    link2 = create(:link, user: user, status: "true")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit user_links_path(user)
    expect(page).to have_content(link1.title)
    expect(page).to have_content(link2.title)

    click_button "See All Read"

    expect(page).not_to have_content(link1.title)
    expect(page).to have_content(link2.title)
  end

  scenario "filter by unread", js: true do
    user = create(:user)
    link1 = create(:link, user: user, title: "Title 1")
    link2 = create(:link, user: user, status: "true")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit user_links_path(user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit user_links_path(user)
    expect(page).to have_content(link1.title)
    expect(page).to have_content(link2.title)

    click_button "See All Unread"

    expect(page).to have_content(link1.title)
    expect(page).not_to have_content(link2.title)
  end
end
