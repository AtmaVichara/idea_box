require 'rails_helper'

describe "user can see single idea" do
  context "user navigates to show from index" do
    it "sees single idea" do
      category = create(:category)
      user = create(:user)
      idea = create(:idea, category_id: category.id, user_id: user.id)
      visit user_path(user)

      click_link idea.title

      expect(page).to have_content(idea.title)
      expect(page).to have_content(idea.body)
    end
  end
end
