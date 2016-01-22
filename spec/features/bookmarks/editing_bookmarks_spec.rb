require "rails_helper"

RSpec.feature "Users can edit their bookmarks" do
  let(:user) { create(:user) }
  let!(:adele_bookmark) { create(:bookmark, :adele, user: user) }

  before do
    login_as(user)
    visit bookmarks_path
    click_link adele_bookmark.title
   end

  scenario "with valid fields" do
    click_link adele_bookmark.title
    fill_in "Title", with: "Emotion"
    click_button "Update Bookmark"

    expect(page).to have_content "Bookmark has been updated."
    expect(page).to have_content "Emotion"
  end

  scenario 'when providing invalid attributes' do
    click_link adele_bookmark.title
    fill_in "Title", with: ""
    click_button "Update Bookmark"

    expect(page).to have_content "Bookmark has not been updated."
  end

 
end
