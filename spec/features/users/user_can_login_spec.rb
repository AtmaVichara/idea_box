require 'rails_helper'

describe "user can login" do
  context "navigates to login page from welcome page" do
    xit "logins in user" do
      user = create(:user)
      visit root_path

      click_on "Login"

      fill_in "email", with: "#{user.email}"
      fill_in "password", with: "#{user.password_digest}"
      save_and_open_page
      click_on "Login"

      expect(page).to eq(user_path(user))
      expect(page).to have_content(user.username)
    end
  end
end