require "rails_helper"

describe "admin can create new images" do
  context "from the admin images index page" do
    it "creates images" do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_images_path

      click_on "Add New Image"

      fill_in "image[image_url]", with: "https://t00.deviantart.net/UN6l70sJvOFlfBjxApikae3cKfA=/fit-in/700x350/filters:fixed_height(100,100):origin()/pre00/8994/th/pre/i/2013/120/7/2/catbug_vector_by_ah_dashie-d63ku5z.png"
      click_on "Add Image"

      expect(current_path).to eq(admin_images_path)
    end
  end
end
