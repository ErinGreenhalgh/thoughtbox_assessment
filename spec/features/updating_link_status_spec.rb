require "rails_helper"

RSpec.feature "updating link status" do
  context "from unread to read", js: true do
    scenario "by clicking mark as read" do
      user = create(:user)
      link = create(:link, user: user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_links_path(user)
      expect(page).to have_content("Mark as Read")
      expect(page).not_to have_content("Mark as Unread")
      click_button "Mark as Read"
      expect(page).not_to have_content("Mark as Read")
      expect(page).to have_content("Mark as Unread")

      link_div = find("div[id='#{link.id}']")
      grey = "rgba(128, 128, 128, 1)"
      expect(link_div.native.style("background-color")).to eql(grey)
    end
  end

  context "from read to unread", js: true do
    scenario "by clicking mark as unread" do
      user = create(:user)
      link = create(:link, user: user, status: "read")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_links_path(user)
      expect(page).not_to have_content("Mark as Read")
      expect(page).to have_content("Mark as Unread")
      click_button "Mark as Unread"
      expect(page).to have_content("Mark as Read")
      expect(page).not_to have_content("Mark as Unread")

      link_div = find("div[id='#{link.id}']")
      expect(link_div.native.style("background-color")).to eql("transparent")
    end
  end
end
