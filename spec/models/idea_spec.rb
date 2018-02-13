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
end
