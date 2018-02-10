require 'rails_helper'

describe "user sees all ideas" do
  context "from ideas index page" do
    it "shows all ideas" do
      idea = create_list(:idea, 4)
      visit ideas_path

      expect(page).to have_content(idea[0].body)
      expect(page).to have_content(idea[0].title)
      expect(page).to have_content(idea[1].body)
      expect(page).to have_content(idea[1].title)
      expect(page).to have_content(idea[2].body)
      expect(page).to have_content(idea[2].title)
      expect(page).to have_content(idea[3].body)
      expect(page).to have_content(idea[3].title)
    end
  end
end
