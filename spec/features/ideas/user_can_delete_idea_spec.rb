require 'rails_helper'

describe "user can delete idea" do
  context "user navigates to show page" do
    it "deletes idea" do
      category = create(:category)
      user = create(:user)
      idea1 = create(:idea, category_id: category.id, user_id: user.id)
      idea2 = create(:idea, category_id: category.id, user_id: user.id)

      visit user_path(user)
      click_link(idea1.title)

      click_on "Delete"

      expect(page).to_not have_content(idea1.title)
      expect(page).to have_content(idea2.title)
    end
  end
end
