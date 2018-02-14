require 'rails_helper'

describe "admin sees all images" do
  context "linking from welcome page" do
    it "sees all images" do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      images = create_list(:image, 4)

      visit root_path
      click_link "Images"

      expect(page).to have_content(images[0].name)
      expect(page).to have_content(images[1].name)
      expect(page).to have_content(images[2].name)
      expect(page).to have_content(images[3].name)
    end
  end
end
