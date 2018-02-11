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
end
