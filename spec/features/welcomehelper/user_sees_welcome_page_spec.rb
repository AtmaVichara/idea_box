require 'rails_helper'

describe "user sees welcome page" do
  context "from root path" do
    it "show welcome page with links" do
      visit root_path

      expect(page).to have_link("Sign Up")
      expect(page).to have_link("Log In")
    end
  end
end
