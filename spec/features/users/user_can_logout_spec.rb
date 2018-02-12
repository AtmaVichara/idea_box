require 'rails_helper'

describe "user can logout" do
  it "user logs out" do
    user = create(:user)
    visit root_path

    click_on "Log In"

    fill_in "email", with: "#{user.email}"
    fill_in "password", with: "#{user.password}"
    click_on "Login"

    expect(page).to have_content(user.username)

    click_on "Logout"

    expect(current_path).to eq('/')
  end
end
