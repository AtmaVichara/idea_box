require 'rails_helper'

describe "user sees single category" do
  context "navigate from index page" do
    it "shows single category" do
      category = create(:category)
      idea = create(:idea, category_id: category.id)
      idea2 = create(:idea, category_id: category.id)
      idea3 = create(:idea, category_id: category.id)

      visit categories_path

      click_link "#{category.name}"

      expect(page).to have_link(idea.title)
      expect(page).to have_link(idea2.title)
      expect(page).to have_link(idea3.title)
    end
  end
end
