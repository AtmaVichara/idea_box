require 'rails_helper'

describe "user sees single category" do
  context "navigate from index page" do
    it "shows single category" do
      user = create(:user)
      category = create(:category)
      idea = create(:idea, category_id: category.id, user_id: user.id)
      idea2 = create(:idea, category_id: category.id, user_id: user.id)
      idea3 = create(:idea, category_id: category.id, user_id: user.id)

      visit categories_path

      click_link "#{category.name}"

      expect(page).to have_link(idea.title)
      expect(page).to have_link(idea2.title)
      expect(page).to have_link(idea3.title)
    end
  end
  context 'from admin category show page' do
    it 'shows 404 page' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      category = create(:category)

      visit admin_category_path(category)

      expect(page).to_not have_link("Edit Category")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
