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

      #expect background color of the div to be grey
    end
  end

  context "from read to unread", js: true do
    scenario "by clicking mark as unread" do
      # expect background color of the div to be white
    end
  end
end
