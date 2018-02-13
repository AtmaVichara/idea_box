require "rails_helper"

describe "admin can edit category" do
  context "from the admin category show page" do
    it "edits category" do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      category = create(:category)

      visit admin_category_path(category)

      click_on "Edit"

      fill_in 'category[name]', with: "World Changers"
      click_on "Update Category"

      expect(current_path).to eq(admin_category_path(category))
      expect(page).to have_content("World Changers")
    end
  end
end
