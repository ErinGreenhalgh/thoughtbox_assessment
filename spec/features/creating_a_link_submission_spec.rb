require "rails_helper"

RSpec.feature "user creates a link submission" do
  context "successfully", js: true do
    scenario "by submitting valid information" do
      user = User.create(email: "e@gmail.com", password: "password")
      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/'
      within('.login') do
        fill_in 'email', with: user.email
        fill_in 'password', with: user.password
        fill_in 'password_confirmation', with: user.password
        click_button "Log In"
      end

      title = "Turing School"
      url   = "turing.io"

      visit user_links_path(user)
      expect(page).to have_content("Submit a New Link")

      find("input[class='new-link-title']").send_keys("#{title}")
      find("input[class='new-link-url']").send_keys("#{url}")
      click_button "Submit Link"
      # byebug

      link = Link.last
      expect(link.url).to eq(url)
      expect(link.title).to eq(title)
      expect(link.status).to eq("false")
      expect(link.user).to eq(user)

      expect(current_path).to eq links_path

      within(".all-links") do
        within("#link-#{link.id}") do
          expect(page).to have_content link.url
          expect(page).to have_content link.title
          expect(page).to have_content link.status
        end
      end
    end
  end

  #include sad path for unsuccessful creation
  # Submitting an invalid link should result in an error message being displayed.
end
