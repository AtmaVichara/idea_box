require 'rails_helper'

describe "admin sees single image" do
  context "from admin_image_path" do
    it "shows single image" do
      image = create(:image)
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_image_path(admin, image)

      expect(page).to have_content(image.name)
      expect(page).to have_button("Delete")
      expect(page).to have_xpath("/html/body/img")
    end
  end
end
