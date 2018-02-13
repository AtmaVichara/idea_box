require "rails_helper"

describe Image, type: :model do
  describe "relationships" do
    it {should have_many(:idea_images)}
    it {should have_many(:ideas).through(:idea_images)}
  end
end
