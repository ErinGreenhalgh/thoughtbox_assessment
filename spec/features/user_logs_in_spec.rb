require 'rails_helper'

RSpec.feature "user logs in" do
  context "with valid information" do
    scenario "as a registered user" do
      user = User.create(email: "tommy@gmail.com", password: "password")
      visit "/"
      click_link "Log In"
      fill_in "session[email]",    with: user.email
      fill_in "session[password]", with: user.password
      fill_in "session[password_confirmation]", with: user.password
      click_button 'Log In'

      expect(current_path).to eq user_links_path(user)
      expect(page).to have_content("Welcome, #{user.email}")
      expect(page).not_to have_content("Log In")
      expect(page).to have_content("Log Out")
    end
  end
end
