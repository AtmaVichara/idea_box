require 'rails_helper'

describe 'admin can see single category' do
  context 'on admin category show path' do
    it 'shows category' do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      category = create(:category)

      visit admin_category_path(category)

      expect(page).to have_content(category.name)
      expect(page).to have_link("Edit Category")
    end
  end
end
