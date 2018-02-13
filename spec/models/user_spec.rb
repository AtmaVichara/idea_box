require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_uniqueness_of(:username)}
    it {should validate_uniqueness_of(:email)}
  end
  describe "roles" do
    it "can be created as an admin" do
      admin = User.create!(username: "Amata", email: "atmavich@gmail", password: 'password', role: 1)

      expect(admin.role).to eq("admin")
      expect(admin.admin?).to be_truthy
    end
    it "can be created as regular user" do
      user = User.create!(username: "Amata", email: "atmavich@gmail", password: 'password', role: 0)

      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end
    it "can be created as regular user" do
      defaulted = User.create!(username: "Amata", email: "atmavich@gmail", password: 'password')

      expect(defaulted.role).to eq("default")
      expect(defaulted.default?).to be_truthy
    end
  end
end
