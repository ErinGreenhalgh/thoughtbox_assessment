require "rails_helper"

RSpec.feature "visitor creates an account" do
  context "successfully" do
    scenario "as a new user" do
      email = "erin@turing.io"
      password = "password"
      password_confirmation = "password"

      expect(User.count).to eq 0

      visit '/'
      click_link "Sign Up"
      fill_in "user[email]",    with: email
      fill_in "user[password]", with: password
      fill_in "user[password_confirmation]", with: password_confirmation
      click_button 'Sign Up'

      user = User.last

      expect(current_path).to eq user_links_path(user)
      expect(User.count).to eq 1
      expect(page).not_to have_content "Log In"
      expect(page).to have_content "Log Out"
    end
  end
end
