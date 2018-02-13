require 'rails_helper'

describe "admin sees all categories and links" do
  context "from admin categories path" do
    it "shows categories and links for delete and create" do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      category = create_list(:category, 4)

      visit admin_categories_path
      expect(page).to have_link(category[0].name)
      expect(page).to have_link(category[1].name)
      expect(page).to have_link(category[2].name)
      expect(page).to have_link(category[3].name)
      expect(page).to have_link("Create Category")
      expect(page).to have_link("Delete")
    end
  end
end
