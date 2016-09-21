require "rails_helper"

RSpec.feature "sorting links alphabetically" do
  scenario "by clicking the Sort Alphabetically button", js: true do
    user = create(:user)
    link_a = create(:link, title: "A Link", user: user)
    link_b = create(:link, title: "B Link", user: user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_links_path(user)
    expect(page).to have_content("All Links")
    titles = page.find_all(".title")
    expect(titles[0].text).to eq link_b.title
    expect(titles[1].text).to eq link_a.title

    click_button "Sort Alphabetically"

    titles = page.find_all(".title")
    expect(titles[0].text).to eq link_a.title
    expect(titles[1].text).to eq link_b.title
  end
end
