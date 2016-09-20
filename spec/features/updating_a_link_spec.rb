require "rails_helper"

RSpec.feature "updating a link" do
  context "successfully", js: true do
    # scenario "by entering a valid url" do
    #   user = create(:user)
    #   link = create(:link, user: user)
    #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    #   new_url = "https://github.com"
    #
    #   visit user_links_path(user)
    #
    #   click_button "Edit"
    #
    #   # page.execute_script("$('url-#{link.id}').val('');")
    #   fill_in("input[id='url-#{link.id}']", with: "")
    #   # find("div[id='url-#{link.id}']").select(text)
    #   find("div[id='url-#{link.id}']").send_keys("#{new_url}")
    #   page.find("body").click
    #
    #   expect(page).to have_content(new_url)
    #   expect(Link.find(link.id).url).to eq new_url
    # end
  end

  context "unsuccessfully", js: true do
    scenario "by entering an invalid url" do
      user = create(:user)
      link = create(:link, user: user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      bad_url = "BAD URL"

      visit user_links_path(user)

      click_button "Edit"

      find("div[id='url-#{link.id}']").send_keys("#{bad_url}")
      page.find("body").click

      expect(page.driver.browser.switch_to.alert.text).to eq("Url must be valid!")
      page.driver.browser.switch_to.alert.accept
    end
  end
end
