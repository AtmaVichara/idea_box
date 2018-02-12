require 'rails_helper'

describe "user can login" do
  context "navigates to login page from welcome page" do
    it "logins in user" do
      user = create(:user)
      visit root_path

      click_on "Log In"

      fill_in "email", with: "#{user.email}"
      fill_in "password", with: "#{user.password}"
      click_on "Login"

      expect(page).to have_content(user.username)
    end
  end
end
