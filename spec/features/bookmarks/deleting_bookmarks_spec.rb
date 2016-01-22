require "rails_helper"

RSpec.feature "Users can delete their bookmarks" do
	let(:user) { create(:user) }
	let!(:bookmark) { create(:bookmark, user: user) }

	before do
		login_as(user)
		visit bookmarks_path
	end

	scenario "successfully" do
		click_link "Remove #{bookmark.title}"

		expect(page).to have_content "Bookmark has been deleted."
		expect(page).to_not have_content bookmark.title
	end
end
