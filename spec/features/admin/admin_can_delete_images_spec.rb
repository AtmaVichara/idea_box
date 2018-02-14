require "rails_helper"

describe "admin can delete images" do
  context "from the admin images show page" do
    it "deletes image" do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      image = create(:image)

      visit admin_image_path(image)

      click_on "Delete"

      expect(page).to_not have_xpath("/html/body/div/a/img")
    end
  end
end
