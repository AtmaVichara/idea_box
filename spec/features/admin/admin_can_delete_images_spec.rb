require "rails_helper"

describe "admin can delete images" do
  context "from the admin images index page" do
    it "deletes image" do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      image = create(:image)

      visit admin_images_path

      click_on "Delete"

      expect(page).to not_have('Image 1')
    end
  end
end 
