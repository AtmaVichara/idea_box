require 'rails_helper'

describe 'user sees all categories' do
  context 'from category index page' do
    it 'shows all categories' do
      category = create_list(:category, 4)

      visit categories_path

      expect(page).to have_link(category[0].name)
      expect(page).to have_link(category[1].name)
      expect(page).to have_link(category[2].name)
      expect(page).to have_link(category[3].name)
    end
  end
  context 'from admin category index page' do
    it 'show 404 page' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_categories_path

      expect(page).to_not have_link("Create Category")
      expect(page).to_not have_link("Delete")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
