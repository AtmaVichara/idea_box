require 'rails_helper'

RSpec.describe Idea, type: :model do
  describe "validations" do
    it {should validate_presence_of(:body)}
    it {should validate_presence_of(:title)}
  end

  describe "relationships" do
    it {should belong_to(:category)}
    it {should have_many(:idea_images)}
    it {should have_many(:images).through(:idea_images)}
  end

  describe "instance methods" do
    it "should add images to an instance of idea" do
      images = create_list(:image, 4)
      image_ids = images.map(&:id)
      user = create(:user)
      idea = create(:idea, user_id: user.id)

      idea.set_images(image_ids)

      expect(idea.images).to include(images[0])
      expect(idea.images).to include(images[1])
      expect(idea.images).to include(images[2])
      expect(idea.images).to include(images[3])
    end
  end
end
