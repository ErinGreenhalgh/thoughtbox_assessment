require "rails_helper"

RSpec.feature "user creates a link submission" do
  context "successfully", js: true do
    scenario "by submitting valid information" do
      user = User.create(email: "e@gmail.com", password: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      title = "Turing School"
      url   = "http://turing.io"

      visit user_links_path(user)
      expect(page).to have_content("Submit a New Link")

      find("input[class='new-link-title']").send_keys("#{title}")
      find("input[class='new-link-url']").send_keys("#{url}")
      click_button "Submit Link"

      within(".all-links") do
        expect(page).to have_content url
        expect(page).to have_content title
      end

      link = Link.last
      expect(link.url).to eq(url)
      expect(link.title).to eq(title)
      expect(link.status).to eq("false")
      expect(link.user).to eq(user)

      expect(current_path).to eq user_links_path(user)
    end
  end

  context "unsuccessfully", js: true do
    scenario "by submitting an invalid url" do
      user = User.create(email: "e@gmail.com", password: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      title = "Bad URL"
      url   = "invalid url"

      visit user_links_path(user)
      expect(page).to have_content("Submit a New Link")

      find("input[class='new-link-title']").send_keys("#{title}")
      find("input[class='new-link-url']").send_keys("#{url}")
      click_button "Submit Link"


      expect(page.driver.browser.switch_to.alert.text).to eq("Url is not a valid URL")
      page.driver.browser.switch_to.alert.accept

      within(".all-links") do
        expect(page).not_to have_content url
        expect(page).not_to have_content title
      end

      expect(Link.find_by(title: title)).to eq nil
    end
  end

  # context "unsuccessfully", js: true do
  #   scenario "by leaving url blank" do
  #
  #   end
  # end
end
