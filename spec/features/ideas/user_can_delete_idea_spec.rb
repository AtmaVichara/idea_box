require 'rails_helper'

describe "user can delete idea" do
  context "user navigates to show page" do
    it "deletes idea" do
      idea1 = create(:idea)
      idea2 = create(:idea)

      visit ideas_path
      click_link(idea1.title)

      click_on "Delete"

      expect(page).to_not have_content(idea1.title)
      expect(page).to have_content(idea2.title)
    end
  end
end
