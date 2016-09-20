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

  # context "with invalid information" do
  #   scenario "with the wrong password" do
  #     user = User.create(email: "erin@gmail.com", password: "password")
  #     visit "/"
  #     click_link "Log In"
  #
  #     fill_in "session[email]",    with: user.email
  #     fill_in "session[password]", with: "WRONG PASSWORD"
  #     fill_in "session[password_confirmation]", with: "WRONG PASSWORD"
  #     click_button 'Log In'
  #     save_and_open_page
  #     expect(page).to have_content "Invalid Password"
  #     expect(current_path).to eq(login_path)
  #   end
  #
  #   scenario "with an email that hasn't been registered" do
  #     user = User.create(email: "tom@gmail.com", password: "password")
  #     visit "/"
  #     click_link "Log In"
  #
  #     fill_in "session[email]",    with: "nothing@gmail.com"
  #     fill_in "session[password]", with: user.password
  #     fill_in "session[password_confirmation]", with: user.password
  #     click_button 'Log In'
  #
  #     expect(page).to have_content "Invalid Email"
  #     expect(current_path).to eq(login_path)
  #   end
  # end
end
