require 'rails_helper'

RSpec.feature "user logs in" do
  context "with valid information" do
    scenario "as a registered user" do
      user = User.create(email: "tommy@gmail.com", password: "password")
      visit "/"
      click_link "Log In"
      fill_in "session[email]",    with: user.email
      fill_in "session[password]", with: user.password
      click_button 'Log In'

      expect(current_path).to eq user_links_path(user)
      expect(page).to have_content("Welcome, #{user.email}")
      expect(page).not_to have_content("Log In")
      expect(page).to have_content("Log Out")
    end
  end

  context "with invalid information" do
    scenario "with an incorrect password" do
      user = create(:user)

      visit "/"
      click_link "Log In"
      fill_in "session[email]",    with: user.email
      fill_in "session[password]", with: "WRONG"
      click_button 'Log In'
      expect(page).to have_content("Invalid. Please try again or sign up if you do not have an account.")
    end

    scenario "with an unregistered email" do
      visit "/"
      click_link "Log In"
      fill_in "session[email]",    with: "unregistered@email.com"
      fill_in "session[password]", with: "password"
      click_button 'Log In'
      expect(page).to have_content("Invalid. Please try again or sign up if you do not have an account.")
    end
  end
end
