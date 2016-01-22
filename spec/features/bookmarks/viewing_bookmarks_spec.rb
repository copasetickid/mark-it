require "rails_helper"

RSpec.feature "Users can view  bookmarks" do
  let(:user) { create(:user) }
  let!(:adele_bookmark) { create(:bookmark, :adele, user: user) }

  before do
    login_as(user)
  end

  scenario "their own bookmarks" do
    visit bookmarks_path
    click_link adele_bookmark.title 

    expect(page).to have_content adele_bookmark.title
  end
end
