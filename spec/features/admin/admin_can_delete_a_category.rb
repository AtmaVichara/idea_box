describe "admin can delete category spec" do
  context "from category show page" do
    it "deletes category" do
      admin = create(:admin)
      category = create(:category)
      category2 = create(:category)

      visit categories_path

      within("#category_#{category.id}") do
        click_on "Delete"
      end

      expect(current_path).to eq(categories_path)
      expect(page).to_not have_content(category.name)
    end
  end
end
