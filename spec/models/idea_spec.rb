require 'rails_helper'

RSpec.describe Idea, type: :model do
  describe "validations" do
    it {should validate_presence_of(:body)}
  end 

end
