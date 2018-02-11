require 'rails_helper'

describe "user sees all ideas" do
  context "from ideas index page" do
    it "shows all ideas" do
      category = create(:category)
      idea = create_list(:idea, 4, category_id: category.id)
      visit ideas_path

      expect(page).to have_link(idea[0].title)
      expect(page).to have_link(idea[1].title)
      expect(page).to have_link(idea[2].title)
      expect(page).to have_link(idea[3].title)
    end
  end
end
