require 'rails_helper'

describe "user can create new idea" do
  context "links from from the ideas index" do
    xit "creates new idea" do
      user = create(:user)
      category = create(:category)
      visit user_path(user)

      click_on "New Idea"

      fill_in 'idea[title]', with: "Locally Sourced Buttered Lettuce"
      fill_in 'idea[body]', with: "Through communal living and peaceful means, we will locally source buttered lettuce and sell it on the black market for a large profit!!"
      find('select').find(:xpath, '//*[@id="idea_category_id"]/option').select_option
      click_on "Create Idea"

      expect(page).to have_content("Locally Sourced Buttered Lettuce")
      expect(page).to have_content("Through communal living and peaceful means, we will locally source buttered lettuce and sell it on the black market for a large profit!!")
    end
  end
end
