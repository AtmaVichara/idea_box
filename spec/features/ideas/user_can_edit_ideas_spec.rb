require 'rails_helper'

describe "user can edit an idea" do
  context "navigates to show page from index" do
    it "edits idea" do
      idea = create(:idea)

      visit ideas_path
      click_link(idea.title)

      click_on "Edit"

      fill_in 'idea[title]', with: "Locally Sourced Buttered Lettuce"
      fill_in 'idea[body]', with: "Through communal living and peaceful means, we will locally source buttered lettuce and sell it on the black market for a large profit!!"
      click_on "Update Idea"

      expect(page).to have_content("Locally Sourced Buttered Lettuce")
      expect(page).to have_content("Through communal living and peaceful means, we will locally source buttered lettuce and sell it on the black market for a large profit!!")
    end
  end
end
