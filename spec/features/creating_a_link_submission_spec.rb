require "rails_helper"

RSpec.feature "user creates a link submission" do
  context "successfully" do
    scenario "by submitting valid information" do
      user = User.create(email: "hello", password: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      url   = "turing.io"
      title = "Turing School"

      visit links_path
      within(".create-link") do
        expect(page).to have_content("Submit a New Link")
        fill_in "link[title]", with: title
        fill_in "link[url]", with: url
        click_button "Submit Link"
      end

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
