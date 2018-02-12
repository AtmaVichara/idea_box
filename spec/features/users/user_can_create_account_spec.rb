require 'rails_helper'

describe 'user can create account' do
  context "navigates to signup page from welcome screen" do
    it 'creates an account' do
      visit root_path

      click_on "Sign Up"

      fill_in "user[username]", with: 'AtmaVicharaEsq'
      fill_in "user[email]", with: "atma_vichara_jewel@gmail.com"
      fill_in "user[password]", with: "Linked through the net of Indra"
      click_on "Create Account"

      expect(current_path).to eq('/users/1')
      expect(page).to have_content("AtmaVicharaEsq")
    end
  end
end
