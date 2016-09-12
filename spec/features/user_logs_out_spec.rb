require "rails_helper"

RSpec.feature "user logs out" do
  context "successfully" do
    scenario "as a registered user" do
      user = User.create(email: "hello", password: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit links_path
      click_link "Log Out"

      expect(current_path).to eq root_path
      expect(page).to have_content ("Log In")
      expect(page).not_to have_content("Log Out")
    end
  end
end
