require "rails_helper"

describe Image, type: :model do
  describe "relationships" do
    it {should have_many(:idea_images)}
    it {should have_many(:ideas).through(:idea_images)}
  end
  describe "validations" do
    it {should validate_attachment_content_type(:image).
                      allowing("image/jpg", "image/jpeg", "image/png")}
  end
end
