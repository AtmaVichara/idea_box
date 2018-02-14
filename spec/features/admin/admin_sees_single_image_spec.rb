require 'rails_helper'

describe "admin sees single image" do
  context "from admin_image_path" do
    it "shows single image" do
      image = create(:image)
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_image_path(admin, image)

      exepct(page).to have_content(image.name)
      exepct(page).to have_link("Delete")
      exepct(page).to have_xpath("Delete")
    end
  end
end
