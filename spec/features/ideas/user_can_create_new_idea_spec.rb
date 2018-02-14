require 'rails_helper'

describe "user can create new idea" do
  context "links from from the ideas index" do
    it "creates new idea" do
      user = create(:user)
      category = create(:category)
      image = create_list(:image, 2)
      visit user_path(user)

      click_on "New Idea"

      fill_in 'idea[title]', with: "Locally Sourced Buttered Lettuce"
      fill_in 'idea[body]', with: "Through communal living and peaceful means, we will locally source buttered lettuce and sell it on the black market for a large profit!!"
      find('select').find(:xpath, '//*[@id="idea_category_id"]/option').select_option
      all('input[type=checkbox]').each { |checkbox| checkbox.set(true)}
      click_on "Create Idea"

      expect(current_path).to eq("/users/#{user.id}/ideas/#{Idea.last.id}")
      expect(page).to have_content("Locally Sourced Buttered Lettuce")
      expect(page).to have_xpath("/html/body/img[1]")
      expect(page).to have_xpath("/html/body/img[2]")
      expect(page).to have_content("Through communal living and peaceful means, we will locally source buttered lettuce and sell it on the black market for a large profit!!")
    end
  end
end
