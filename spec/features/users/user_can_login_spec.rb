require 'rails_helper'

describe "user can login" do
  context "navigates to login page from welcome page" do
    it "logins in user" do
      user = User.create!(username: "AtmaVichara", email: "AtmaV@gmail.com", password_digest: "password")
      visit root_path

      click_on "Login"

      fill_in "email", with: "AtmaV@gmail.com"
      fill_in "password", with: "password"
      click_on "Login"

      expect(page).to eq(user_path(user))
      expect(page).to have_content(user.username)
    end
  end
end
