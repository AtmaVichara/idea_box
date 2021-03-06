require 'rails_helper'

describe "user can edit an idea" do
  context "navigates to show page from index" do
    it "edits idea" do
      category  = create(:category)
      user      = create(:user)
      idea      = create(:idea, category_id: category.id, user_id: user.id)
      image = create_list(:image, 2)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)
      click_link(idea.title)

      click_on "Edit"

      fill_in 'idea[title]', with: "Locally Sourced Buttered Lettuce"
      fill_in 'idea[body]', with: "Through communal living and peaceful means, we will locally source buttered lettuce and sell it on the black market for a large profit!!"
      find('select').find(:xpath, '//*[@id="idea_category_id"]/option').select_option
      all('input[type=checkbox]').each { |checkbox| checkbox.set(true)}
      click_on "Update Idea"

      expect(page).to have_content("Locally Sourced Buttered Lettuce")
      expect(page).to have_xpath("/html/body/img[1]")
      expect(page).to have_xpath("/html/body/img[2]")
      expect(page).to have_content("Through communal living and peaceful means, we will locally source buttered lettuce and sell it on the black market for a large profit!!")
    end
  end
end
