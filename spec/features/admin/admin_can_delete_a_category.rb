describe "admin can delete category spec" do
  context "from category show page" do
    it "deletes category" do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      category = create(:category)
      category2 = create(:category)
      idea = create(:idea, category_id: category.id, user_id: admin.id)

      visit admin_category_path(category)
      
      within("#category_#{category.id}") do
        click_on "Delete"
      end

      expect(current_path).to eq(categories_path)
      expect(page).to_not have_content(category.name)
      expect(page).to have_content(category2.name)
    end
  end
end
