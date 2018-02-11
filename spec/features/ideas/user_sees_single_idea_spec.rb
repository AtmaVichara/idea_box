require 'rails_helper'

describe "user can see single idea" do
  context "user navigates to show from index" do
    it "sees single idea" do
      category = create(:category)
      idea = create(:idea, category_id: category.id)
      visit ideas_path

      click_link idea.title

      expect(page).to have_content(idea.title)
      expect(page).to have_content(idea.body)
    end
  end
end
