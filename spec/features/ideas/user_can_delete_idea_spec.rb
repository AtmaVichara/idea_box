require 'rails_helper'

describe "user can delete idea" do
  context "user navigates to show page" do
    it "deletes idea" do
      category = create(:category)
      idea1 = create(:idea, category_id: category.id)
      idea2 = create(:idea, category_id: category.id)

      visit ideas_path
      click_link(idea1.title)

      click_on "Delete"

      expect(page).to_not have_content(idea1.title)
      expect(page).to have_content(idea2.title)
    end
  end
end
