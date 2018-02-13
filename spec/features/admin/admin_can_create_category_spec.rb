require "rails_helper"

describe "admin can create categories" do
  context "from category index page" do
    it "creates new category" do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      click_on "Create Category"

      fill_in 'category[name]', with: "Best Ideas"

      click_on "Create Category"

      expect(current_path).to eq(admin_category_path(Category.last))
      expect(page).to have_content("Best Idea")
    end
  end
end
