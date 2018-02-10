require 'rails_helper'

RSpec.describe Idea, type: :model do
  describe "validations" do
    it {should validate_presence_of(:body)}
    it {should validate_presence_of(:title)}
  end
end
