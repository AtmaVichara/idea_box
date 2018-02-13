require 'rails_helper'

describe "admin can create categories" do
  context "from category index page" do
    it "creates new category" do
      visit categories_path

      click_on "Create Category"

      fill_in 'category[name]', with: "Best Ideas"
      click_on "Create Category"

      expect(current_path).to eq(category_path(Category.last))
      expect(page).to have_content("Best Idea")
    end
  end
end
